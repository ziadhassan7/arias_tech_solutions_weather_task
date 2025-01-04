import 'package:arias_tech_solutions_weather_task/core/app_router.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app_common/custom_button.dart';
import '../../../weather/presentation/screens/weather_info_page.dart';
import '../controller/location_util.dart';

class GetCurrentLocationBtn extends StatelessWidget {
  const GetCurrentLocationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        transparentColor: true,
        onPressed: () async {
          LatLong? userLocation = await LocationUtil.getCurrentLocation(context);

          if(userLocation != null && context.mounted) {
            AppRouter.navigateTo(context, WeatherInfoPage(latLong: userLocation,));
          }
        },
        prefixIcon: SvgPicture.asset('assets/icons/gps.svg',),
        child: const Text('Get by current location')
    );
  }
}