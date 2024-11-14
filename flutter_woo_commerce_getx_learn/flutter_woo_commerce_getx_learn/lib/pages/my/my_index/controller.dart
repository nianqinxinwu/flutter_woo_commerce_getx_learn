import 'package:get/get.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  // 注销
  void onLogout() {
    UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }

  _initData() {
    update(["my_index"]);
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
