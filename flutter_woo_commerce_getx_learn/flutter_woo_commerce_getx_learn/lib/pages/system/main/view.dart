import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX();

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MainPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("main")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
