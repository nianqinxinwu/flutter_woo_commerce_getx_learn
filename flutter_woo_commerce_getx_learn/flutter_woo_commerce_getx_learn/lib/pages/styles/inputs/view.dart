import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({super.key});

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildInput().center(),
    );
  }

  Widget _buildInput() {
    return <Widget>[
      /// 文本
      const InputWidget.text(
        hintText: "文本",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 文本/边框
      const InputWidget.textBorder(
        hintText: "文本/边框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 文本/填充/边框
      InputWidget.textFilled(
        hintText: "文本/填充/边框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 图标/文本/填充/边框
      InputWidget.iconTextFilled(
        const IconWidget.svg(
          AssetsSvgs.cHomeSvg,
        ),
        hintText: "图标/文本/填充/边框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 后缀图标/文本/填充/边框
      InputWidget.suffixTextFilled(
        const IconWidget.svg(
          AssetsSvgs.cHomeSvg,
        ),
        hintText: "后缀图标/文本/填充/边框",
      ).width(300).paddingBottom(AppSpace.listRow),

      /// 搜索
      InputWidget.search(
        hintText: "搜索",
      ).width(300).paddingBottom(AppSpace.listRow),

      // END
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputsController>(
      init: InputsController(),
      id: "inputs",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("inputs")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
