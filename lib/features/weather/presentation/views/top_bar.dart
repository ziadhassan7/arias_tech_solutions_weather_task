import 'package:arias_tech_solutions_weather_task/core/styles/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../search/presentation/views/search_input_field.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 80,

      child: Row(
        children: [
          /// Back Button
          backButton(context),

          const SizedBox(width: 12,),

          /// Search bar (with auto-complete)
          const Expanded(child: SearchInputField(searchFieldInWeatherPage: true,)),
        ],
      ),
    );
  }

  Widget backButton(BuildContext context){
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      onTap: (){
        Navigator.pop(context);
      },

      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: CustomDecoration(
          isCircular: true,
          borderWidth: 1,
          borderColor: Colors.white
        ),

        child: SvgPicture.asset('assets/icons/back.svg'),
      ),
    );
  }
}
