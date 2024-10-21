import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class ButtonsPage extends GetView<ButtonsController> {
  const ButtonsPage({super.key});

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [_buildButtons()],
      ).paddingAll(AppSpace.card),
    );
  }

  Widget _buildButtons() {
    return <Widget>[
      // Primary 主按钮 1
      ButtonWidget.primary(
        "主按钮",
        onTap: () {
          const Dialog(
            child: Text("点击了主按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),

      // Secondary 次按钮 2
      ButtonWidget.secondary(
        "次按钮",
        onTap: () {
          const Dialog(
            child: Text("点击了次按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),

      // Text 文字按钮 3
      ButtonWidget.text(
        "文字按钮",
        textSize: 15,
        onTap: () {
          const Dialog(
            child: Text("点击了文字按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),

      // Icon 图标按钮 4
      ButtonWidget.icon(
        const IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30,
        ),
        onTap: () {
          const Dialog(
            child: Text("点击了图标按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),

      // IconTextOutlined 图标+文字按钮 5
      ButtonWidget.textFilled(
        "15",
        bgColor: Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
        onTap: () {
          const Dialog(
            child: Text("点击了图标+文字按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),

      // IconTextRoundFilled 图标+文字按钮 6
      ButtonWidget.textRoundFilled(
        "5",
        bgColor: Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
        borderRadius: 12,
        textSize: 9,
        onTap: () {
          const Dialog(
            child: Text("点击了图标+文字按钮"),
          );
        },
      )
          .tight(
            width: 24,
            height: 24,
          )
          .paddingBottom(AppSpace.listRow),

      // IconTextUpDown 图标+文字按钮 7
      ButtonWidget.iconTextUpDown(
        const IconWidget.svg(AssetsSvgs.cHomeSvg, size: 30),
        "Home",
        onTap: () {
          const Dialog(
            child: Text("点击了图标+文字按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),

      // IconTextOutlined 图标+文字按钮 8
      ButtonWidget.iconTextOutlined(
        const IconWidget.svg(AssetsSvgs.cHomeSvg, size: 30),
        "Home",
        onTap: () {
          const Dialog(
            child: Text("点击了图标+文字按钮"),
          );
        },
      )
          .tight(
            width: 100,
            height: 50,
          )
          .paddingBottom(AppSpace.listRow),

      // IconTextRoundOutlined 图标+文字按钮 9
      ButtonWidget.iconTextUpDownOutlined(
        const IconWidget.svg(AssetsSvgs.cHomeSvg, size: 30),
        "Yes",
        onTap: () {
          const Dialog(
            child: Text("点击了图标+文字按钮"),
          );
        },
      )
          .tight(
            width: 100,
            height: 60,
          )
          .paddingBottom(AppSpace.listRow),

      // textIcon, // 文字/图标 按钮 10
      ButtonWidget.textIcon(
        "Home",
        const IconWidget.svg(
          AssetsSvgs.cHomeSvg,
          size: 30,
        ),
        onTap: () {
          const Dialog(
            child: Text("点击了文字/图标按钮"),
          );
        },
      ).paddingBottom(AppSpace.listRow),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonsController>(
      init: ButtonsController(),
      id: "buttons",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("buttons")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
