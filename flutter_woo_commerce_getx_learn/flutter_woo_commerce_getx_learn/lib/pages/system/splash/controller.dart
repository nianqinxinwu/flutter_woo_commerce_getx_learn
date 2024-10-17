import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/names.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  // _initData() {
  //   update(["splash"]);
  // }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  _jumpToPage() {

    // 欢迎页
    Future.delayed(const Duration(seconds: 1), (){
      Get.offNamed(RouteNames.systemWelcome);
    });
  }

  @override
  void onReady() {
    super.onReady();

    // 删除设备启动图
    FlutterNativeSplash.remove();
    // _initData();
    _jumpToPage();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
