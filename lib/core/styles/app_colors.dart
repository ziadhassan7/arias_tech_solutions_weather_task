import 'package:flutter/material.dart';

class AppColors {
  //Text Color
  static const Color textColor = Colors.white;
  static Color textColorHint = Colors.black.withOpacity(0.4);

  //Gradient
  static const Gradient backgroundGradientColor = LinearGradient(
      begin: Alignment(-1.6, 0.0),
      end: Alignment(1.0, 0.0),
      //transform: GradientRotation(math.pi / 2.7),
      colors: [Color(0xFF225496), Color(0xFF0A1B30)]);

  static const Color primaryColor = Colors.white;

  static Color textFieldUnFocusedColor = AppColors.textColor.withOpacity(0.5);
  static Color textFieldFocusedColor = AppColors.textColor.withOpacity(0.7);
}
