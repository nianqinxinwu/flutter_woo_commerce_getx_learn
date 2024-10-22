import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  // 右侧商品列表
  Widget _buildRightList() {
    return GetBuilder<CategoryController>(
      id: "product_list",
      builder: (controller) {
        return SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true, // 开启上拉加载
          onRefresh: controller.onRefresh, // 下拉刷新
          onLoading: controller.onLoading, // 上拉加载
          footer: const SmartRefresherFooterWidget(),

          child: controller.items.isEmpty
            ?
            //占位图
            const PlaceholdWidget()
              :
              // 商品列表
              GridView.builder(
                itemCount: controller.items.length, // 商品数量

                itemBuilder: (context, index) {
                  var product = controller.items[index]; // 商品项数

                  // 商品项组件
                  return ProductItemWidget(
                    product, // 商品
                    imgHeight: 117.w, // 图片高度
                  );
                },

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 每行2个
                  mainAxisSpacing: AppSpace.listRow.w, // 主轴间距
                  crossAxisSpacing: AppSpace.listItem.w, // 交叉轴间距
                  childAspectRatio: 0.8, // 宽高比
                ),
              ),
        )
        // padding 水平间距
        .paddingHorizontal(AppSpace.listView);
      },
    );
  }
  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 左侧导航栏
      _buildLeftNav(),
      // 右侧商品列表
      _buildRightList().expanded(),
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
