import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../app_common/text_view/custom_text.dart';
import '../../data/weather_model.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, this.cityName, required this.data,});

  final String? cityName;
  final WeatherModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                      width: 140, height: 140,
                      child: getWeatherIcon(data.current!.weather!.first.icon!)),

                  const SizedBox(width: 24,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(cityName ?? '', size: 18, color: AppColors.textColor,),
                        TextView('${data.current!.temp!.round()}°C', size: 60, color: AppColors.textColor),
                      ],
                    ),
                  )
                ],),
              ],
            ),
          ),),

        SizedBox(
          height: 140,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.daily!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      TextView(getDayFromIndex(index), color: AppColors.textColor,),

                      const SizedBox(height: 12,),

                      SizedBox(
                          width: 45,
                          child: getWeatherIcon(data.daily![index].weather!.first.icon!)),

                      TextView(data.daily![index].temp!.day!.round().toString(), color: AppColors.textColor,),
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }

  // Get forecast days from list index counter
  String getDayFromIndex(int index) {
    // Days of the week starting from Sunday
    const daysOfWeek = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];

    // Get the current day index (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    int dayNumber = DateTime.now().weekday % 7;

    // Calculate the day from the index
    int adjustedDayIndex = dayNumber + index;

    // Get the following day
    int followingDay = (adjustedDayIndex + 1) % 7;

    // Return the corresponding day
    return daysOfWeek[followingDay];
  }


  // Get corresponding weather icon from API weather keys
  Widget getWeatherIcon(String weatherCode){

    switch(weatherCode){
      case '01d':
      case '01n':
        return Image.asset('assets/weather/$weatherCode.png');

      case '02d':
      case '02n':
        return Image.asset('assets/weather/$weatherCode.png');

      case '03d':
      case '04d':
        return Image.asset('assets/weather/03d.png');

      case '03n':
      case '04n':
        return Image.asset('assets/weather/03n.png');

      case '09d':
      case '09n':
        return Image.asset('assets/weather/09.png');

      case '10d':
      case '10n':
        return Image.asset('assets/weather/$weatherCode.png');

      case '11d':
      case '11n':
        return Image.asset('assets/weather/$weatherCode.png');

      case '13d':
      case '13n':
        return Image.asset('assets/weather/13.png');

      case '50d':
      case '50n':
        return Image.asset('assets/weather/50.png');

      default:
        return Image.asset('assets/weather/02d.png');
    }
  }
}
