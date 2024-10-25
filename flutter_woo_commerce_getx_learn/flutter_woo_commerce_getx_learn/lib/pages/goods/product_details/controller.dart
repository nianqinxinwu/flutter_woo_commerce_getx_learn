import 'package:get/get.dart';

/// 商品详情控制器
class ProductDetailsController extends GetxController
  with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  _initData() {
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
