import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

/// 商品详情控制器
class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  // tab 控制器
  late TabController tabController;
  // tab 控制器选择位置
  int tabIndex = 0;

  // 商品id, 获取路由传递参数
  int? productId = Get.arguments['id'] ?? 0;

  // 商品详情数据
  ProductModel? product;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中的颜色列表
  List<String> colorKeys = [];

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];
  // 选中的尺寸列表
  List<String> sizeKeys = [];

  // 读取缓存
  _loadCache() async {
    // 颜色列表
    var stringColors = Storage().getString(Constants.storageProductsAttributesColors);

    colors = stringColors != ""
      ? jsonDecode(stringColors).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList()
      : [];

    // 尺寸列表
    var stringSizes = Storage().getString(Constants.storageProductsAttributesSizes);

    sizes = stringSizes != ""
      ? jsonDecode(stringSizes).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList()
      : [];
  }

  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["product_colors"]); // 手动刷新
  }

  // 尺寸选中
  void onSizeTap(List<String> keys) {
    sizeKeys = keys;
    update(["product_sizes"]); // 手动刷新
  }

  // 拉取商品详情数据
  _loadProduct() async {
    // 商品详情
    product = await ProductApi.productDetail(productId!);

    // Banner 数据
    if (product?.images != null) {
      bannerItems = product!.images!
          .map<KeyValueModel>((e) => KeyValueModel(
                key: "${e.id}",
                value: e.src ?? "",
              ))
          .toList();
    }

    // 选中值
    if (product?.attributes != null) {
      // 颜色
      var colorArrt = product?.attributes?.where((e) => e.name == "Color");

      if (colorArrt?.isNotEmpty == true) {
        colorKeys = colorArrt?.first.options ?? [];
      }
      // 尺寸
      var sizeArrt = product?.attributes?.where((e) => e.name == "Size");

      if (sizeArrt?.isNotEmpty == true) {
        sizeKeys = sizeArrt?.first.options ?? [];
      }
    }
  }


  // 切换 Banner
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新
  }

  // 图片浏览
  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(GalleryWidget(
      initialIndex: index,
      items: bannerItems.map<String>((e) => e.value!).toList(),
    ));
  }

  _initData() async {
    await _loadCache();
    await _loadProduct();
    // 初始化 tab 控制器
    tabController = TabController(length: 3, vsync: this);

    update(["product_details"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // 切换 tab
  void onTabBarTap(int index) {
    tabIndex = index;
    tabController.animateTo(index);
    update(["product_tab"]); // 手动刷新
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
