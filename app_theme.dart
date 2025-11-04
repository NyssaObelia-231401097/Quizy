import 'package:flutter/material.dart';

class AppColors {
  static const Color darkGreen = Color(0xFF405436); // background utama
  static const Color gold = Color(0xFFEDC949);      // warna logo Quizy
  static const Color lime = Color(0xFFA9BE70);      // warna tombol Next/Submit
  static const Color correct = Color(0xFF34C759);   // jawaban benar
  static const Color wrong = Color(0xFFFF383C);     // jawaban salah

  // card/background transparan (5% & 18% sesuai desain)
  static Color cardBG = Colors.white.withOpacity(0.05);
  static Color cardBorder = Colors.white.withOpacity(0.18);
}

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: "Rubik",
    scaffoldBackgroundColor: AppColors.darkGreen,

    /// AppBar sesuai desain (background 405436 dan teks putih)
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGreen,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Rubik",
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),

    /// ElevatedButton default (tidak memaksa full width)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lime,
        textStyle: TextStyle(
          fontFamily: "Rubik",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    /// Text umum
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Rubik",
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Rubik",
      ),
    ),
  );
}
