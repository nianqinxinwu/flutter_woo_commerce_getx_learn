import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';

class TabProductView extends GetView<ProductDetailsController> {

  final String uniqueTag;

  const TabProductView({super.key, required this.uniqueTag});

  @override
  String? get tag => uniqueTag;

  @override
  Widget build(BuildContext context) {
    return const Text("商品规格");
  }
}
