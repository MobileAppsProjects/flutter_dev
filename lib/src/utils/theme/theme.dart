import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TAppTheme {
  static ThemeData ligth = ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(primaryColor, {
      50: Color(0xFFfff5f2),
      100: Color(0xFFffeae3),
      200: Color(0xFFffd6c8),
      300: Color(0xFFffb9a2),
      400: Color(0xFFff865e),
      500: Color(primaryColor),
      600: Color(0xFFcc3300),
      700: Color(0xFFb32d00),
      800: Color(0xFF8d2300),
      900: Color(0xFF751d00),
      950: Color(0xFF660000),
    }),
  );
  static ThemeData dark = ThemeData(brightness: Brightness.dark);
}
