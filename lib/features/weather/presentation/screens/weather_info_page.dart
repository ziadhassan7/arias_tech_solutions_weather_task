import 'package:arias_tech_solutions_weather_task/features/app_common/scaffold_gradient.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:flutter/material.dart';

class WeatherInfoPage extends StatelessWidget {
  const WeatherInfoPage({super.key, this.latLong, this.cityName});

  final LatLong? latLong;
  final String? cityName;

  @override
  Widget build(BuildContext context) {

    return ScaffoldGradient(
      child: SizedBox(),
    );
  }
}
