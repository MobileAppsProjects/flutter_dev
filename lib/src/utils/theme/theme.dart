import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'theme_text.dart';

class TAppTheme {
  static ThemeData ligth = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: const MaterialColor(primaryColor, {
        50: Color(primaryColor50),
        100: Color(primaryColor100),
        200: Color(primaryColor200),
        300: Color(primaryColor300),
        400: Color(primaryColor400),
        500: Color(primaryColor),
        600: Color(primaryColor600),
        700: Color(primaryColor700),
        800: Color(primaryColor800),
        900: Color(primaryColor900),
        950: Color(primaryColor950),
      }),
    ),
    textTheme: TTextTheme.light,
  );
  static ThemeData dark = ThemeData(brightness: Brightness.dark);
}
