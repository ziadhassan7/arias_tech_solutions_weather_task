import 'package:flutter/material.dart';

class AppColors {
  //Text Color
  static const Color textColor = Colors.white;
  static Color textColorHint = Colors.black..withValues(alpha: 0.4);

  //Gradient
  static const Gradient backgroundGradientColor = LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(0.0, 1.0),
      //transform: GradientRotation(math.pi / 2.7),
      colors: [Color(0xFF225496), Color(0xFF0A1B30)]);

  static const Color primaryColor = Colors.white;

  static const Color button = Color.fromRGBO(10, 79, 179, 1.0);
  static const Color dimButton = Color.fromRGBO(18, 39, 68, 0.4);

  static Color textFieldUnFocusedColor = AppColors.textColorHint.withValues(alpha: 0.4);
  static Color textFieldFocusedColor = AppColors.textColorHint.withValues(alpha: 0.6);
}
