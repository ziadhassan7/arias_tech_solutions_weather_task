import 'package:arias_tech_solutions_weather_task/core/app_screen.dart';
import 'package:arias_tech_solutions_weather_task/features/app_common/text_view/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../app_common/custom_button.dart';

class NoLocationDialog extends StatelessWidget {
  const NoLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const SizedBox(height: 12,),

        /// Description
        const TextView("Location Service Disabled", size: 18, maxLines: 2,),
        const TextView("Please enable location services to use this feature.", opacity: 0.5, size: 12, maxLines: 3,),

        const SizedBox(height: 24,),

        /// Buttons
        Row(
          children: [
            // Open Settings
            SizedBox(
              width: AppScreen(context).width * 0.36,
              child: CustomButton(
                  onPressed: (){
                    Geolocator.openLocationSettings();
                    Navigator.pop(context);
                  },
                  child: const TextView('Open settings', size: 14,)
              ),
            ),

            // Cancel
            TextButton(
              onPressed: ()=> Navigator.pop(context),
              child: const TextView('Cancel', color: AppColors.button,)
            )
          ],
        )
      ],
    );
  }
}
