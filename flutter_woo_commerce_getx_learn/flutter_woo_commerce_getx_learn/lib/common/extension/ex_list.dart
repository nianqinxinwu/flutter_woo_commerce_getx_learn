import 'package:flutter/material.dart';

/// 扩展 List<String> 的方法
extension ExStringListWidget<E> on List<String> {
  /// 是否有值
  bool hasValue(String val) {
    if (isNotEmpty == true) {
      if (indexWhere((element) => element == val) != -1) {
        return true;
      }
    }
    return false;
  }
}

/// 扩展 List<Widget> 的方法
extension ExListWidget<E> on List<Widget> {
  /// 转 Wrap
  Widget toWrap({
    Key? key,
    double spacing = 0,
    double runSpacing = 0,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) =>
      Wrap(
        key: key,
        spacing: spacing,
        runSpacing: runSpacing,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        children: this,
      );

  /// 转 Column
  Widget toColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget? separator,
  }) =>
      Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: separator != null && length > 0
            ? (expand((child) => [child, separator]).toList()..removeLast())
            : this,
      );

  /// 转 Row
  Widget toRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget? separator,
  }) =>
      Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: separator != null && length > 0
            ? (expand((child) => [child, separator]).toList()..removeLast())
            : this,
      );

  Widget toContainer({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
    Color? color = Colors.white,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    Widget? separator,
  }) =>
      Container(
        key: key,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: separator,
      );

  /// 转 Stack
  Widget toStack({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      Stack(
        key: key,
        alignment: alignment,
        textDirection: textDirection,
        fit: fit,
        clipBehavior: clipBehavior,
        children: this,
      );

  /// 转 ListView
  Widget toListView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
  }) =>
      ListView(
        key: key,
        scrollDirection: scrollDirection,
        children: this,
      );
}
