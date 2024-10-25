
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

/// 商品详情控制器
class ProductDetailsController extends GetxController
  with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  // 商品id, 获取路由传递参数
  int? productId = Get.arguments['id'] ?? 0;

  // 商品详情数据
  ProductModel? product;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // 拉取商品详情数据
  _loadProduct() async {
    // 商品详情
    product = await ProductApi.productDetail(productId!);

    // Banner 数据
    if (product?.images!= null) {
      bannerItems = product!.images!
      .map<KeyValueModel>((e) => KeyValueModel(
        key: "${e.id}",
        value: e.src ?? "",
      )).toList();
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
      items:bannerItems.map<String>((e) => e.value!).toList(),
    ));
  }

  _initData() async {

    await _loadProduct();

    update(["product_details"]);
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
