import 'package:flutter/material.dart';
import 'common/index.dart';
import 'package:get/get.dart';

import "global.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init(); // 初始化 GetX
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,

      // 路由
      initialRoute: RouteNames.stylesStylesIndex,//systemSplash,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],

      // 多语言
      translations: Translation(), // 词典
      localizationsDelegates: Translation.localizationsDelegates, // 代理
      supportedLocales: Translation.supportedLocales, // 支持语言
      locale: ConfigService.to.locale,// 当前语言
      fallbackLocale: Translation.fallbackLocale, // 默认语言
    );
  }
}


