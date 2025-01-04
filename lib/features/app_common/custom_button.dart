import 'package:flutter/material.dart';
import '../../core/app_screen.dart';
import '../../core/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.child, this.prefixIcon, this.color,});

  final Function()? onPressed;
  final Widget child;
  final Widget? prefixIcon;
  final Color? color;


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: AppScreen(context).width,
      height: 57,

      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.textColor.withValues(alpha: 0.4),
            backgroundColor: AppColors.button,
            textStyle: buttonTextStyle(),
          ),

          onPressed: onPressed,
          child: Row(
            children: [
              (prefixIcon == null)
                ? const SizedBox.shrink()
                : Opacity(
                  opacity: 0.4,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 16, ),
                      child: prefixIcon,
                  ),
                ),

              child,
            ],
          )
      ),
    );
  }


  TextStyle buttonTextStyle(){
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'inder',
    );
  }
}
