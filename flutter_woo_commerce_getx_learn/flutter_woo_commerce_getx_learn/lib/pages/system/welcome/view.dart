import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/slider_indicator.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  // slider 视图
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: controller,
      builder: (controller) =>
      controller.items == null ?
      const SizedBox() :
      WelcomeSliderWidget(
        controller.items!,
        onPageChanged: controller.onPageChanged
      ),

    );
  }

  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: "bar",
      init: controller,
      builder: (controller) {
        return <Widget>[
          // 指示器
          SliderIndicatorWidget(
            length: 3,
            currentIndex: controller.currentIndex),
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround,);
      }
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // slider 切换
      _buildSlider(),
      // 控制栏
      _buildBar(),
    ].toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround,)
    .paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("welcome")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
