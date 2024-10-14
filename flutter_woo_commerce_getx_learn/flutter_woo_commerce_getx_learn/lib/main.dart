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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // 路由
      initialRoute: RouteNames.systemSplash,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


