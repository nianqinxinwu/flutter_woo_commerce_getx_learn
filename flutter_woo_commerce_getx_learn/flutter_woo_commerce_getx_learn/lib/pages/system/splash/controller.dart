import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
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
    Future.delayed(const Duration(seconds: 1), () {
      // 欢迎页未展示过
      if (ConfigService.to.isAlreadyOpen == false) {
        Get.offNamed(RouteNames.systemWelcome);
      } else {
        // 欢迎页已展示过
        Get.offAllNamed(RouteNames.main);

        // 未登录时展示登录页

        // 封装组件测试入口
        // Get.offNamed(RouteNames.stylesStylesIndex);
      }
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
