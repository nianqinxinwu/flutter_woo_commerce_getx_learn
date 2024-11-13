import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';
import 'package:get/get.dart';

class FilterView extends GetView<SearchFilterController> {
  const FilterView({super.key});

    // 顶部 关闭
  Widget _buildTopBar() {
    return <Widget>[
      // 文字
      TextWidget.title3(LocaleKeys.searchFilter.tr),

      // 关闭按钮
      ButtonWidget.icon(
        IconWidget.icon(
          Icons.close,
          size: 15,
          color: AppColors.secondary,
        ),
        onTap: controller.onFilterCloseTap,
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingBottom(AppSpace.listRow);
  }

  Widget _buildView() {
    return <Widget>[
      // 顶部
      _buildTopBar(),

    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    )
    .paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: "filter_view",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
