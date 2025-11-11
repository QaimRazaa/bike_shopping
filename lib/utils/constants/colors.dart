import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color darkGrey = Color(0xff202634);
  static const Color darkBlue = Color(0xff3176B7);

  static const Color darkBackground = Color(0xFF1a2332);
  static const Color cardBackground = Color(0xFF2a3547);
  static const Color accentBlue = Color(0xFF2196F3);

  static const LinearGradient diagonalGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [darkGrey, darkBlue],
    stops: [0.5, 0.5],
  );
}