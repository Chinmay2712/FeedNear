// lib/app/constants/theme.dart

import 'package:flutter/material.dart';
import 'colors.dart'; // Import your color constants

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.neutralColor, // Background color
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor, // AppBar background color
        elevation: 0, // Optional: remove shadow from AppBar
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.neutralColor, // Input field background color
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor, // Default button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor, // Text color on button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.secondaryColor,
      ),
    );
  }
}
