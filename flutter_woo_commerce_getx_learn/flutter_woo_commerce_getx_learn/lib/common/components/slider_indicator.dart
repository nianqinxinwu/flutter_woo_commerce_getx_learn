import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

class SliderIndicatorWidget extends StatelessWidget {
  /// 个数
  final int length;

  /// 当前索引
  final int currentIndex;

  /// 颜色
  final Color color;

  /// 是否原型
  final bool isCircle;

  /// 对齐方式
  final MainAxisAlignment alignment;

  SliderIndicatorWidget({
    super.key,
    required this.length,
    required this.currentIndex,
    Color? color,
    this.isCircle = false,
    this.alignment = MainAxisAlignment.center,
  }) : color = color ?? AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,

      // 采用 list.generate 方式生成 item 项
      children: List.generate(length, (index) {
        debugPrint("{数量: $length}");
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          // 圆型宽度 6 , 否则当前位置15 , 其他位置 8
          width: !isCircle
              ? currentIndex == index
                  ? 15.0
                  : 8
              : 6,
          height: !isCircle ? 4 : 6,
          decoration: BoxDecoration(
            // 圆角 4
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: currentIndex == index ? color : color.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
