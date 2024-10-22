import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  // 左侧导航栏
  Widget _buildLeftNav() {
    return GetBuilder<CategoryController>(
      id: "left_nav",
      builder: (_) {
        return ListView.separated(
          itemBuilder: (context, index) {
            var item = controller.categoryItems[index];
            return CategoryListItemWidget(
              category: item, // 分类数据
              selectId: controller.categoryId, // 当前选中的分类id
              onTap: controller.onCategoryTap, // 点击事件回调
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: AppSpace.listRow.w); // 间隔
          }
          ,
          itemCount: controller.categoryItems.length, // 分类数量
        )// 指定高度 100
            .width(100.w)

            // 背景色
            .decorated(
              color: AppColors.surfaceVariant,
            )

            // 右上，右下 裁剪圆角
            .clipRRect(
              topRight: AppRedius.card.w,
              bottomRight: AppRedius.card.w,
            );
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 左侧导航栏
      _buildLeftNav(),
      // 右侧商品列表

    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      id: "category",
      builder: (_) {
        return Scaffold(
          // 顶部导航栏
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.gCategoryTitle.tr,
          ),
          // 内容
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
