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

  // 多语言
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 是否第一次打开
  bool get isAlreadyOpen => Storage().getBool(Constants.storageAlreadOpen);

  @override
  void onReady() {
    super.onReady();
    getPlatform();
    initLocale();
    initTheme();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 标记已打开过App
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadOpen, true);
  }

  // 初始主题
  void initTheme() {
    // 从本地获取主题 key
    var themeCode = Storage().getString(Constants.storageThemeCode);
    // 判断是不是dark模式
    _isDarkModel.value = themeCode == 'dark' ? true : false;
    Get.changeTheme(
      // 通过GetX 发送消息切换主题
      themeCode == 'dark' ? AppTheme.dark : AppTheme.light,
    );
  }

  // 切换主题
  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppTheme.dark : AppTheme.light,
    );
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? 'dark' : 'light');
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
