import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // Flutter 与原生端 的接口初始化
    var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    // 本地存储初始化(工具类)
    await Storage().init();
    Loading(); // Toast 工具类初始化

    // 将Get  压到内存中初始化
    Get.put<ConfigService>(ConfigService());

    // 网络请求初始化
    Get.put<WPHttpService>(WPHttpService());
  }
}
