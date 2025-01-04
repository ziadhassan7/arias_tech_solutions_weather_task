import 'package:flutter/material.dart';
import '../../core/styles/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color, this.size, this.alignment = Alignment.center});

  final Color? color;
  final double? size;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
          height: size, width: size,
          child: CircularProgressIndicator(color: color ?? AppColors.primaryColor,)),
    );
  }
}
