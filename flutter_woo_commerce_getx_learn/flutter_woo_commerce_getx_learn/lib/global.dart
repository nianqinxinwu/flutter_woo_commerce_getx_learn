import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // Flutter 与原生端 的接口初始化
    WidgetsFlutterBinding.ensureInitialized();


    // 将Get  压到内存中初始化
    Get.put<ConfigService>(ConfigService());

    // 本地存储初始化(工具类)
    await Storage().init();
  }
}

