import 'index.dart';
import 'package:flutter/material.dart';

// 主题
class AppTheme {
  // 亮色主题
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: false,
    fontFamily: "Montserrat",
  );
  // 暗色主题
  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: false,
    fontFamily: "Montserrat",
  );
}
