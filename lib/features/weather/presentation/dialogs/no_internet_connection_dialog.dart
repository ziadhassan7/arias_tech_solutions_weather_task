import 'package:arias_tech_solutions_weather_task/features/app_common/custom_button.dart';
import 'package:arias_tech_solutions_weather_task/features/app_common/text_view/custom_text.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionDialog extends StatelessWidget {
  const NoInternetConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Center(child: Image.asset('assets/sad_emoji.png')),

        const SizedBox(height: 4,),

        const TextView("There is no internet connection!", size: 18, maxLine: 2,),
        const TextView("Try opening your WiFi or mobile data.", opacity: 0.5, size: 12,),

        const SizedBox(height: 36,),

        CustomButton(onPressed: ()=> Navigator.pop(context), child: const Text('Ok!'))
      ],
    );
  }
}