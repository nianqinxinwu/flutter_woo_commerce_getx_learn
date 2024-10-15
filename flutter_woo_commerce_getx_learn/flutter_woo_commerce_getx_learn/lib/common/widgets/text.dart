import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

class TextWidget extends StatelessWidget {
  /// 文字字符串
  final String text;

  /// 样式
  final TextStyle? style;

  /// 颜色
  final Color? color;

  /// 大小
  final double? size;

  /// 重量
  final FontWeight? weight;

  /// 行数
  final int? maxLines;

  /// 自动换行
  final bool? softWrap;

  /// 溢出
  final TextOverflow? overflow;

  /// 对齐方式
  final TextAlign? textAlign;

  const TextWidget({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.textAlign,
  });

  /// 文字 - 标题1
  const TextWidget.title1(
    this.text, {
     super.key,
     this.color,
     this.size,
     this.weight,
     this.maxLines = 1,
     this.softWrap = false,
     this.overflow = TextOverflow.clip,
     this.textAlign,
     }) : style = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      );

 /// 文字 - 标题2
  const TextWidget.title2(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        );

/// 文字 - 标题3
  const TextWidget.title3(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );

/// 文字 - 正文1
  const TextWidget.body1(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );

/// 文字 - 正文2
  const TextWidget.body2(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );

/// 文字 - 正文3
  const TextWidget.body3(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w300,
        );

 /// 文字 - 按钮
  TextWidget.button(
    {
    super.key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    Color? color,
    this.size,
    this.weight,
    this.textAlign,
  })  : color = color ?? AppColors.secondary,
        style = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color,
  );

/// 文字 - 导航
  const TextWidget.navigation({
    super.key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        );


  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox();
    }

    return Text(
      text,
      style: style?.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ) ?? TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
