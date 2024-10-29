import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 商品详情
class TabDetailView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabDetailView({super.key, required this.uniqueTag});

  @override
  String? get tag => uniqueTag;

  // 标题
  _buildTitle(String title) {
    return TextWidget.title3(title).paddingBottom(AppSpace.listRow);
  }

  // 内容
  _buildContent(String? title) {
    return TextWidget.title2(
      title ?? "-",
      softWrap: true,
      maxLines: 10,
    ).paddingBottom(AppSpace.listRow * 2);
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 说明
      _buildTitle(LocaleKeys.gDetailProductDesc.tr),
      _buildContent(controller.product?.description?.clearHtml),

      // sku
      _buildTitle(LocaleKeys.gDetailProductSKU.tr),
      _buildContent(controller.product?.sku ?? "-"),

      // price
      _buildTitle(LocaleKeys.gDetailProductPrice.tr),
      _buildContent(controller.product?.price ?? "-"),

      // 市场价
      _buildTitle(LocaleKeys.gDetailMarketPrice.tr),
      _buildContent(controller.product?.regularPrice ?? "-"),

      // 重量
      _buildTitle(LocaleKeys.gDetailWeight.tr),
      _buildContent(controller.product?.weight ?? "-"),

      // 尺寸
      _buildTitle(LocaleKeys.gDetailDimensions.tr),
      _buildContent(
          "${controller.product?.dimensions?.length} X ${controller.product?.dimensions?.width} X ${controller.product?.dimensions?.height}"),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .scrollable()
        .paddingVertical(AppSpace.page);
  }
}
