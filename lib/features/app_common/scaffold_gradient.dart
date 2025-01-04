import 'package:flutter/material.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/box_decoration.dart';

class ScaffoldGradient extends StatelessWidget {
  const ScaffoldGradient({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomDecoration(
          gradientColor: AppColors.backgroundGradientColor
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: child,
          )
        )
      ),
    );
  }
}
