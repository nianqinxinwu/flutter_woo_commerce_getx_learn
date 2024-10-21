import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  HomeController();

  // 导航点击事件
  void onAppBarTap() {}

  // Banner 当前索引
  int bannerCurrentIndex = 0;
  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 点击事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  // 分类导航数据
  List<CategoryModel> categoryItems = [];

  // 推荐商品列表数据
  List<ProductModel> flashSellProductList = [];

  // 最新商品列表数据
  List<ProductModel> newProductProductList = [];

    // 分类点击事件
  void onCategoryTap(int categoryId) {}

  // ALL 点击事件
  void onAllTap(bool featured) {}

  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  // 页码
  int _page = 1;
  // 页尺寸
  final int _limit = 20;

  /// 拉取数据
  /// isRefresh 是否刷新
  Future<bool> _loadNewSell(bool isRefresh) async {
    // 拉取数据
    var result = await ProductApi.products(ProductsReq(
      page: _page,
      prePage: _limit,
    ));

    // 下拉刷新
    if (isRefresh) {
      _page = 1; // 重置页码
      newProductProductList.clear(); // 清空数据
    }

    // 有数据
    if (result.isNotEmpty) {
      // 页数+1
      _page ++;

      // 添加数据
      newProductProductList.addAll(result);
    }

    // 是否空
    return result.isEmpty;
  }

  /// 上拉加载入新商品
  void onLoading() async {
    if (newProductProductList.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadNewSell(false);

        if (isEmpty) {
          // 设置无数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (e) {

          /// 加载失败
          refreshController.loadFailed();
        }
      } else {
        // 设置无数据
        refreshController.loadNoData();
    }
    update(["home_new_sell"]);
  }

  /// 下拉刷新
  void onRefresh() async {
    try {
      // 拉取数据是否为空
      await _loadNewSell(true);
      refreshController.refreshCompleted();
    } catch (error) {
      refreshController.refreshFailed();
    }
    update(["home_new_sell"]);
  }

  _initData() async {
    // 首页
    // Banner
    bannerItems = await SystemApi.banners();

    // 分类
    categoryItems = await ProductApi.categories();

    // 推荐商品
    flashSellProductList = await ProductApi.products(ProductsReq(featured: true));

    // 最新商品
    newProductProductList = await ProductApi.products(ProductsReq());

    update(["home"]);
  }

  void onTap() {}

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
    /// 刷新控制器释放
    refreshController.dispose();
  }
}
