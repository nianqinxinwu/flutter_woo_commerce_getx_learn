import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // Flutter 与原生端 的接口初始化
    var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // 系统样式
    setSystemUI();
    // 本地存储初始化(工具类)
    await Storage().init();
    Loading(); // Toast 工具类初始化

    // 将Get  压到内存中初始化
    Get.put<ConfigService>(ConfigService());

    // 网络请求初始化
    Get.put<WPHttpService>(WPHttpService());

    // 用户信息相关
    Get.put<UserService>(UserService());

    // 注入购物车信息相关服务
    Get.put<CartService>(CartService());
  }

  // 系统样式
  static void setSystemUI() {
    if (GetPlatform.isMobile) {
      // 屏幕方向 竖直上
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      // 透明状态栏
      // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent, // transparent status bar
      // ));
    }

    // if (GetPlatform.isAndroid) {
    // 去除顶部系统下拉和底部系统按键
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // 去掉底部系统按键
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);

    // 自定义样式
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      // 顶部状态栏颜色
      // statusBarColor: Colors.transparent,
      // 该属性仅用于 iOS 设备顶部状态栏亮度
      // statusBarBrightness: Brightness.light,
      // 顶部状态栏图标的亮度
      // statusBarIconBrightness: Brightness.light,

      // 底部状态栏与主内容分割线颜色
      systemNavigationBarDividerColor: Colors.transparent,
      // 底部状态栏颜色
      systemNavigationBarColor: Colors.white,
      // 底部状态栏图标样式
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }
  }
}
