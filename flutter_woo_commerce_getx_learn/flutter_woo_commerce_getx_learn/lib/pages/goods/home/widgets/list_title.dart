import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

/// 列表标题
class BuildListTitle extends StatelessWidget {
  /// 标题
  final String title;

  /// 副标题
  final String? subTitle;

  /// 更多事件
  final Function()? onTap;

  const BuildListTitle({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 标题
      TextWidget.title1(title),

      // 副标题
      TextWidget.title2(
        subTitle ?? "",
        color: AppColors.primary,
      ).paddingLeft(AppSpace.listItem).expanded(),

      // ALL
      <Widget>[
        TextWidget.body1(
          LocaleKeys.gHomeMore.tr,
        ),
        const IconWidget.icon(Icons.chevron_right),
      ]
          .toRow(
            mainAxisSize: MainAxisSize.min,
          )
          .onTap(onTap),
    ].toRow();
  }
}
