import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(414, 896),  // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字

      // 一般返回一个MaterialApp类型的Function()
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',

          // 样式
          theme: ConfigService.to.isDarkModel
            ? AppTheme.dark : AppTheme.light,

          // 路由
          // 测试用路由
          // initialRoute: RouteNames.stylesTextForm,

          initialRoute: RouteNames.systemSplash,
          getPages: RoutePages.list,
          navigatorObservers: [RoutePages.observer],

          // 多语言
          translations: Translation(), // 词典
          localizationsDelegates: Translation.localizationsDelegates, // 代理
          supportedLocales: Translation.supportedLocales, // 支持语言
          locale: ConfigService.to.locale,// 当前语言
          fallbackLocale: Translation.fallbackLocale, // 默认语言
        );
      },
    );
  }
}


