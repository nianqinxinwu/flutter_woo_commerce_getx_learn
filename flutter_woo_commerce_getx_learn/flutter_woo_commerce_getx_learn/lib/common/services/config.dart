import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  Locale locale = PlatformDispatcher.instance.locale;


  @override
  void onReady() {
    super.onReady();
    getPlatform();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    var languageCode = Storage().getString(Constants.storageLanguageCode);
    if (languageCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == languageCode;
    });

    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 切换语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(locale);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }
}
