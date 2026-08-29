import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor:
          AppColors.background,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.green,
        primary: AppColors.green,
      ),

      fontFamily: 'Roboto',

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      inputDecorationTheme:
          const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,

        contentPadding:
            EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(
            Radius.circular(24),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}