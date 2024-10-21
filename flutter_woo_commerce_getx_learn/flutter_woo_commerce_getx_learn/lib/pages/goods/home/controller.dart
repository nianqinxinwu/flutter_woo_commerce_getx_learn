import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
