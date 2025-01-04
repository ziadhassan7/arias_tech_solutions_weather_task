import 'package:flutter/material.dart';
import 'border.dart';

class CustomDecoration extends BoxDecoration {

  final Color? backgroundColor;
  final Gradient? gradientColor;
  final double borderWidth;
  final Color borderColor;
  final double? shadowElevation;
  final double radius;
  final bool isCircular;

  CustomDecoration({
    this.backgroundColor,
    this.gradientColor,
    this.borderWidth= 0,
    this.borderColor= Colors.transparent,
    this.shadowElevation,
    this.radius = 0,
    this.isCircular = false,
  }) : super(
    color: backgroundColor,

    border: CustomBorder(borderWidth: borderWidth, borderColor: borderColor),

    borderRadius: BorderRadius.all(Radius.circular(isCircular ? 10000 : radius)),

    shape: BoxShape.rectangle,

    gradient: gradientColor,

    boxShadow: shadowElevation == null
    ? null
    :[
      BoxShadow(
        color: Colors.black.withOpacity(0.1), // Shadow color
        blurRadius: 20, // Shadow blur radius
        offset: Offset(0, shadowElevation), // Shadow position (horizontal, vertical)
      ),
    ],

  );

  }


