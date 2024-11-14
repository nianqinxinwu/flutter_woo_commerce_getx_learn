import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
import '../index.dart';

/// 价格区间组件
class PriceRangeWidget extends StatelessWidget {
  /// 当前值
  final List<double>? values; // [0, 0]

  /// 拖动事件
  final Function(int, dynamic, dynamic)? onDragging;

  /// 最大值
  final double? max;

  /// 最小值
  final double? min;

  const PriceRangeWidget({
    super.key,
    this.values,
    this.onDragging,
    this.max,
    this.min,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // Row
      <Widget>[
        TextWidget.body3("\$${values?[0]}"),
        const Spacer(),
        TextWidget.body3("\$${values?[1]}"),
      ].toRow(),

      // Slider 控件
      FlutterSlider(
        // 默认值
        values: values!,
        // 区间
        rangeSlider: true,
        // 最大
        max: max,
        // 最小
        min: min,
        // 滑块高
        handlerHeight: 6,
        // 宽
        handlerWidth: 6,
        // 滑块颜色
        trackBar: FlutterSliderTrackBar(
          activeTrackBar: BoxDecoration(
            color: AppColors.highlight,
          ),
          inactiveTrackBar: BoxDecoration(
            color: AppColors.outline,
          ),
        ),

        // 提示
        tooltip: FlutterSliderTooltip(
          leftPrefix: const IconWidget.icon(
            Icons.attach_money,
          ),
          rightSuffix: const IconWidget.icon(
            Icons.attach_money,
          ),
        ),

        // 左侧滑块
        handler: FlutterSliderHandler(
          decoration: const BoxDecoration(),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.highlight,
              borderRadius: const BorderRadius.all(
                Radius.circular(3),
              ),
              border: Border.all(
                color: AppColors.highlight,
                width: 1,
              ),
            ),
          ),
        ),

        // 右侧滑块
        rightHandler: FlutterSliderHandler(
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.highlight,
              borderRadius: const BorderRadius.all(
                Radius.circular(3),
              ),
              border: Border.all(
                color: AppColors.highlight,
                width: 1,
              ),
            ),
          ),
        ),
        // 滑块拖动
        onDragging: onDragging,
      ),
    ].toColumn();
  }
}
