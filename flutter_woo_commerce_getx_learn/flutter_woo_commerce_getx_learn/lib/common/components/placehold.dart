import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

class PlaceholdWidget extends StatelessWidget {
  /// 资源图片地址
  final String? assetImagePath;

  const PlaceholdWidget({
    super.key,
    this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget.asset(assetImagePath ?? AssetsImages.homePlaceholderPng)
        .paddingHorizontal(AppSpace.page)
        .center();
  }
}
