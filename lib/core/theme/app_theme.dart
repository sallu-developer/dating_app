import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xFFF2EFE9);
  static const Color primaryColor = Color(0xFFF65B66);
  static const Color darkTextColor = Color(0xFF222222);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      useMaterial3: true,
      fontFamily: 'Inter',
    );
  }
}
