import 'package:flutter/material.dart';
import '../../constants/colors.dart';

// https://m3.material.io/styles/typography/overview
class TTextTheme {
  // text theme for light mode
  static TextTheme light = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    displayLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: TprimaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: TprimaryColor,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TprimaryColor,
    ),
  );

  // text theme for dark mode
  static TextTheme dark = TextTheme();
}
