import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';
import './widgets/index.dart';

class CartIndexPage extends GetView<CartIndexController> {
  const CartIndexPage({super.key});

  // 订单列表
  Widget _buildOrders() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        LineItem item = CartService.to.lineItems[index];
        // 购物车项
        return CartItem(
          lineItem: item,
        ).paddingAll(AppSpace.card).card();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: AppSpace.listRow);
      },
      itemCount: CartService.to.lineItems.length,
    );
  }

  // 优惠券, 568935ab
  Widget _buildCoupon() {
    return <Widget>[
      // 输入框
      InputWidget.textBorder(
        hintText: "Voucher code",
        fillColor: AppColors.surface,
      ).expanded(),

      SizedBox(
        width: AppSpace.listItem,
      ),

      // 应用按钮
      ButtonWidget.text(
        LocaleKeys.gCartBtnApplyCode.tr,
        textColor: AppColors.highlight,
        textSize: 12.sp,
        textWeight: FontWeight.w500,
      ),
    ].toRow();
  }

  // 统计
  Widget _buildTotal() {
    return <Widget>[
      // 运费，代金券
      <Widget>[
        // 运费
        TextWidget.body3(
            "${LocaleKeys.gCartTextShippingCost.tr}: \$${CartService.to.shipping}"
          ),
        // 代金券
        TextWidget.body3(
            "${LocaleKeys.gCartTextVocher.tr}: \$${CartService.to.discount}"
        ),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      )
      .expanded(),

       // 费用小计
      TextWidget.body2(
              "${LocaleKeys.gCartTextTotal.tr}: \$${CartService.to.totalItemsPrice - CartService.to.discount + CartService.to.shipping}")
          .paddingRight(AppSpace.iconTextMedium),

      // 确认下单 checkout
      ButtonWidget.primary(
        LocaleKeys.gCartBtnCheckout.tr,
        borderRadius: 3.sp,
      ).tight(
        width: 100.w,
        height: 40.w,
      ),
      //
    ]
    .toRow()
    .paddingAll(AppSpace.card)
    .decorated(
      color: AppColors.highlight.withOpacity(0.1),
      border: Border.all(color: AppColors.highlight, width: 1),
    )
    .height(60.w);
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 顶部操作栏

      // 订单列表
      _buildOrders().paddingHorizontal(AppSpace.page).expanded(),

      // 优惠券
      _buildCoupon().paddingAll(AppSpace.page),

      // 费用小计
      _buildTotal(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartIndexController>(
      init: CartIndexController(),
      id: "cart_index",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.gCartTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
