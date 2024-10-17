import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';//hide CarouselController
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 欢迎slider组件
class WelcomeSliderWidget extends StatelessWidget {
  /// 项目
  final List<WelcomeModel> items;

  /// 页面切换回调
  final Function(int) onPageChanged;

  /// 控制器
  final CarouselSliderController? carouselController;

  const WelcomeSliderWidget(
    this.items, {
    super.key,
    required this.onPageChanged,
    this.carouselController,
  });

  Widget sliderItem(WelcomeModel item) {
    return Builder(builder: (context) {
      return <Widget>[
        // 图片
        if (item.image != null)
          Image.asset(
            item.image!,
            fit: BoxFit.cover
          ),
        // 标题
        if (item.title != null)
          TextWidget.title1(
            item.title ?? "",
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
          ),

        // 描述
        if (item.desc != null)
          TextWidget.body1(
            item.desc ?? "",
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
          ),

      ].toColumn(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
      ).width(MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 500.w,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        autoPlay: false,
        onPageChanged: (index, reason) => onPageChanged(index),

      ),
      items: <Widget>[
        for (var item in items) sliderItem(item),
      ].toList(),
    );
  }
}
