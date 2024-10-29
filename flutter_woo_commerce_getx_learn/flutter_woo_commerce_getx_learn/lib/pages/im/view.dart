import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ImPage extends GetView<ImController> {
  const ImPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ImPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImController>(
      init: ImController(),
      id: "im",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("im")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
