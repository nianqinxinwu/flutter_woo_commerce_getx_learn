import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

/// 应用颜色
class AppColors {
  /// *******************************************
  /// 自定义 颜色
  /// *******************************************

  // static Color info = Get.isDarkMode
  //     ? const Color.fromARGB(255, 187, 33, 243)
  //     : const Color(0xFF2196F3);
  // static Color success = const Color(0xFF4CAF50);
  // static Color warning = const Color(0xFFFFC107);
  // static Color danger = const Color(0xFFF44336);

  /// 产品
  static ExtWooColorTheme get woo => Get.theme.extension<ExtWooColorTheme>()!;
  static Color? get highlight =>
      Get.theme.extension<ExtWooColorTheme>()!.highlight;
  // Get.theme.extension<ExtWooColorTheme>()!.highlight!;

  /// 基础色
  static ExtBaseColorTheme get base =>
      Get.theme.extension<ExtBaseColorTheme>()!;
  static Color get info => Get.theme.extension<ExtBaseColorTheme>()!.info!;
  static Color get success =>
      Get.theme.extension<ExtBaseColorTheme>()!.success!;
  static Color get warning =>
      Get.theme.extension<ExtBaseColorTheme>()!.warning!;
  static Color get danger => Get.theme.extension<ExtBaseColorTheme>()!.danger!;

  /// *******************************************
  /// Material System
  /// *******************************************

  static Color get background => Get.theme.colorScheme.surface;

  static Brightness get brightness => Get.theme.colorScheme.brightness;

  static Color get error => Get.theme.colorScheme.error;

  static Color get errorContainer => Get.theme.colorScheme.errorContainer;

  static Color get inversePrimary => Get.theme.colorScheme.inversePrimary;

  static Color get inverseSurface => Get.theme.colorScheme.inverseSurface;

  static Color get onBackground => Get.theme.colorScheme.onSurface;

  static Color get onError => Get.theme.colorScheme.onError;

  static Color get onErrorContainer => Get.theme.colorScheme.onErrorContainer;

  static Color get onInverseSurface => Get.theme.colorScheme.onInverseSurface;

  static Color get onPrimary => Get.theme.colorScheme.onPrimary;

  static Color get onPrimaryContainer =>
      Get.theme.colorScheme.onPrimaryContainer;

  static Color get onSecondary => Get.theme.colorScheme.onSecondary;

  static Color get onSecondaryContainer =>
      Get.theme.colorScheme.onSecondaryContainer;

  static Color get onSurface => Get.theme.colorScheme.onSurface;

  static Color get onSurfaceVariant => Get.theme.colorScheme.onSurfaceVariant;

  static Color get onTertiary => Get.theme.colorScheme.onTertiary;

  static Color get onTertiaryContainer =>
      Get.theme.colorScheme.onTertiaryContainer;

  static Color get outline => Get.theme.colorScheme.outline;

  static Color get primary => Get.theme.colorScheme.primary;

  static Color get primaryContainer => Get.theme.colorScheme.primaryContainer;

  static Color get secondary => Get.theme.colorScheme.secondary;

  static Color get secondaryContainer =>
      Get.theme.colorScheme.secondaryContainer;

  static Color get shadow => Get.theme.colorScheme.shadow;

  static Color get surface => Get.theme.colorScheme.surface;

  static Color get surfaceVariant =>
      Get.theme.colorScheme.surfaceContainerHighest;

  static Color get tertiary => Get.theme.colorScheme.tertiary;

  static Color get tertiaryContainer => Get.theme.colorScheme.tertiaryContainer;
}
