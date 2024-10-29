import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductListController extends GetxController {
  ProductListController();

  /// 是否推荐商品
  final bool featured = Get.arguments["featured"] ?? false;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  // 列表数据
  List<ProductModel> items = [];

  // 页码
  int _page = 1;

  // 页尺寸
  final int _limit = 20;

  // isRefresh 是否刷新
  Future<bool> _loadSearch(bool isRefresh) async {
    // 拉取数据
    var result = await ProductApi.products(ProductsReq(
      // 刷新，重置页数1
      page: isRefresh ? 1 : _page,

      // 每页条数
      prePage: _limit,
    ));

    /// 下拉刷新
    if (isRefresh) {
      _page = 1;
      items.clear();
    }

    // 有数据
    if (result.isNotEmpty) {
      // 页数+1
      _page += 1;
      items.addAll(result);
    }

    // 是否为空
    return result.isEmpty;
  }

  // 上拉加载更多数据
  void onLoading() async {
    if (items.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadSearch(false);

        if (isEmpty) {
          // 无更多数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (error) {
        // 加载失败
        refreshController.loadFailed();
      }
    } else {
      // 无数据
      refreshController.loadNoData();
    }
    update(["product_list"]);
  }

  // 下拉数据刷新
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

  _initData() {
    update(["product_list"]);
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
    // 刷新控制器释放
    refreshController.dispose();
  }
}
