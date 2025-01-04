import 'package:arias_tech_solutions_weather_task/features/location/presentation/views/get_current_location_btn.dart';
import 'package:arias_tech_solutions_weather_task/features/search/presentation/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'features/app_common/scaffold_gradient.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return ScaffoldGradient(

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24, top: 140),
              child: SvgPicture.asset('assets/app_logo/app_logo.svg'),
            ),

            const SearchInputField(),

            const SizedBox(height: 4,),

            const GetCurrentLocationBtn(),
          ],
        ),
      ),
    );
  }
}
