import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';
import 'package:get/get.dart';


class FilterView extends GetView<SearchFilterController> {
  const FilterView({super.key});

  // 标题栏
  Widget _buildTitle(String title) {
    return TextWidget.body2(title).paddingBottom(AppSpace.listRow);
  }



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

  // 价格选择区间
  Widget _buildPriceRange() {
    return GetBuilder<SearchFilterController>(
      id: "filter_price_range",
      builder: (_) {
        return PriceRangeWidget(
          max: 5000,
          min: 0,
          values: controller.priceRange,
          onDragging: controller.onPriceRangeDragging,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  // 尺寸选择
  Widget _buildSizes() {
    return GetBuilder<SearchFilterController>(
      id: "filter_sizes",
      builder: (_) {
        return TagsListWidget(
          onTap: controller.onSizeTap,
          itemList: controller.sizes,
          keys: controller.sizeKeys,
          bgSelectedColor: AppColors.highlight,
          textSelectedColor: AppColors.onPrimary,
          isCircular: true,
          size: 24,
          textSize: 9,
          textWeight: FontWeight.w400,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  // 颜色选择
  Widget _buildColors() {
    return GetBuilder<SearchFilterController>(
      id: "filter_colors",
      builder: (_) {
        return ColorsListWidget(
          onTap: controller.onColorTap,
          itemList: controller.colors,
          keys: controller.colorKeys,
          size: 24,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }


  // 星级选择
   // 评级选择
  Widget _buildStars() {
    return GetBuilder<SearchFilterController>(
      id: "filter_stars",
      builder: (_) {
        return StarsListWidget(
          value: controller.starValue,
          onTap: controller.onStarTap,
          selectedColor: AppColors.highlight,
          size: 18,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }
  // 品牌选择

  // 性别选择



  Widget _buildView() {
    return <Widget>[
      // 顶部
      _buildTopBar(),

      // 价格区间
      _buildTitle(LocaleKeys.searchFilterPrice.tr),
      _buildPriceRange(),

      // 尺寸
      _buildTitle(LocaleKeys.searchFilterSize.tr),
      _buildSizes(),

      // // 颜色
      _buildTitle(LocaleKeys.searchFilterColor.tr),
      _buildColors(),

      // // 星级
      _buildTitle(LocaleKeys.searchFilterReview.tr),
      _buildStars(),
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
