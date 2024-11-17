import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 购物车列表项
class CartItem extends StatelessWidget {
  /// 订单数据
  final LineItem lineItem;

  /// 修改数量事件
  final Function(int)? onChangedQuantity;

  /// 选中事件
  final Function(bool)? onSelect;

  const CartItem({
    super.key,
    required this.lineItem,
    this.onChangedQuantity,
    this.onSelect
  });

  /// 主视图
  Widget _buildView() {
    // 商品
    ProductModel product = lineItem.product!;

    return <Widget>[
      // 图片
      ImageWidget.url(
        Convert.aliImageResize(
          product.images?.first.src ?? "",
          width: 100.w,
        ),
        fit: BoxFit.cover,
        width: 78.w,
        height: 100.w,
        radius: AppRedius.image.w,
      ),

      // 标题、金额、数量
      <Widget>[
        // 标题
        TextWidget.title3(lineItem.name ?? "").paddingBottom(AppSpace.listRow),

        // 属性 Color
        if (product.attributes?.isNotEmpty == true)
          TextWidget.body2(
            "${product.attributes?.first.name} - ${product.attributes?.first.options} ",
          ),

        // 属性 Size
        if (product.attributes?.length == 2)
          TextWidget.body2(
            "${product.attributes?[1].name} - ${product.attributes?[1].options} ",
            ),

        // 金额 + 数量
        <Widget>[
          // 金额
          TextWidget.body2(
            "\$ ${lineItem.total}",
            weight: FontWeight.bold,
          ).expanded(),

          // end
        ].toRow().paddingTop(AppSpace.listRow),

      ].toColumn(),

      // end
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartIndexController>(
      id: "goods_${lineItem.productId}",
      builder: (controller) {
        return _buildView();
      }
    );
  }
}
