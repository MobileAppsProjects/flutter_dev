import 'package:flutter/material.dart';

// https://m3.material.io/styles/typography/overview
class TTextTheme {
  // text theme for light mode
  static TextTheme light = const TextTheme(
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
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );

  // text theme for dark mode
  static TextTheme dark = TextTheme();
}
