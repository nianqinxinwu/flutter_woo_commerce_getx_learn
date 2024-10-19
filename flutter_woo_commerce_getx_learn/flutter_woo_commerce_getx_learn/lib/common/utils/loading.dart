import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  static const int _milliseconds = 500; // 提示 延迟毫秒,提示体验 秒关太快
  static const int _dismissMilliseconds = 2000; // 关闭提示 延迟毫秒

  loading() {
    EasyLoading.instance
      // 关闭延迟
      ..displayDuration = const Duration(milliseconds: _dismissMilliseconds)
      // 指示器类型
      ..indicatorType = EasyLoadingIndicatorType.ring
      // loading样式 自定义
      ..loadingStyle = EasyLoadingStyle.custom
      // 指示器大小
      ..indicatorSize = 35.0
      // 进度条宽度
      ..lineWidth = 2
      // 圆角
      ..radius = 10.0
      // 进度条颜色
      ..progressColor = Colors.white
      // 背景颜色
      ..backgroundColor = Colors.black.withOpacity(0.7)
      // 指示器颜色
      ..indicatorColor = Colors.white
      // 文字颜色
      ..textColor = Colors.white
      // 遮罩颜色
      ..maskColor = Colors.black.withOpacity(0.6)
      // 用户交互
      ..userInteractions = true
      // 点击关闭
      ..dismissOnTap = false;
  }

  // 显示
  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false; // 禁止用户交互
    EasyLoading.show(
      status: text ?? 'Loading...',
    );
  }

  // 错误
  static void error([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showError(text ?? 'Error'),
    );
  }

  // 成功
  static void success([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showSuccess(text ?? 'Success'),
    );
  }

  // toast
  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  // 关闭
  static Future<void> dismiss() async {
    await Future.delayed(
      const Duration(milliseconds: _dismissMilliseconds),
      () {
        EasyLoading.instance.userInteractions = true; // 恢复交互操作
        EasyLoading.dismiss();
      },
    );
  }
}
