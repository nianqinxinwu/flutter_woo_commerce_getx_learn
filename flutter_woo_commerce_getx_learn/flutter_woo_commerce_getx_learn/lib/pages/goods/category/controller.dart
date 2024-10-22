import 'dart:convert';

import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryController extends GetxController {
  CategoryController();

  // 分类 id , 获取路由传递参数
  int categoryId = Get.arguments['id'];

  // 分类数据
  List<CategoryModel> categoryItems = [];

  // 初始化数据
  _initData() async {

    // 读缓存
    var stringCategories = Storage().getString(Constants.storageProductCategories);
    categoryItems = stringCategories!= ""
      ? jsonDecode(stringCategories).map<CategoryModel> ((item) {
          return CategoryModel.fromJson(item);
      }).toList(): [];

    // 缓存为空，从网络获取
    if (categoryItems.isEmpty) {
      // 获取分类数据
      categoryItems = await ProductApi.categories();
    }
    update(["left_nav"]);
  }

  void onTap() {}

  // 分类点击事件
  void onCategoryTap(int id) async {
    categoryId = id;
    // 刷新数据
    refreshController.requestRefresh();
    update(["left_nav"]);
  }

  final RefreshController refreshController = RefreshController(
    initialRefresh: true, // 一开始就会自动下拉刷新
  );

  // 列表
  List<ProductModel> items = [];

  // 页码
  int _page = 1;

  // 页尺寸
  final int _limit = 20;

  // 拉数据
  Future<bool> _loadSearch(bool isRefresh) async {
    // 拉取数据
    var result = await ProductApi.products(ProductsReq(
      // 刷新,重置页数1
      page: isRefresh ? 1 : _page,
      prePage: _limit,
      category: categoryId.toString(),
    ));

    // 下拉刷新
    if (isRefresh) {
      _page = 1;
      items.clear(); // 清空数据
    }

    // 有数据
    if (result.isNotEmpty) {
      // 页数+1
      _page += 1;
      items.addAll(result);
    }
    // 是否是空
    return result.isEmpty;
  }

  // 上拉载入新商品
  void onLoading() async {
    if (items.isNotEmpty) {
      try {
        // 拉取数据
        var isEmpty = await _loadSearch(false);

        if (isEmpty) {
        // 设置无数据
          refreshController.loadNoData();
        } else {
        // 刷新完成
          refreshController.loadComplete();
        }
      } catch (e) {
        refreshController.loadFailed();
      }
    } else {
      // 设置无数据
      refreshController.loadNoData();
    }
    update(["product_list"]);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      await _loadSearch(true);
      refreshController.refreshCompleted();
    } catch (error) {
      // 刷新失败
      refreshController.refreshFailed();
    }
    update(["product_list"]);
  }
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
  }
}
