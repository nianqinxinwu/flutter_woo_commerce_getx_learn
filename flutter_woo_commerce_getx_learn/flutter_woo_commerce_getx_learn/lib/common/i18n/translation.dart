import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'index.dart';

class Translation extends Translations {
  // 当前系统语言
  static Locale? get locale => Get.deviceLocale;

  static const fallbackLocale = Locale('en', 'US');
  // 支持语言列表
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // 翻译资源
  @override
  Map<String, Map<String, String>> get keys => {
        'en': localeEn,
        'zh': localeZh,
      };
}
