import 'package:arias_tech_solutions_weather_task/features/app_common/loading_widget.dart';
import 'package:arias_tech_solutions_weather_task/features/app_common/scaffold_gradient.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/cubit/weather_info_cubit.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/cubit/weather_info_states.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/views/top_bar.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/views/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_common/network_util.dart';

class WeatherInfoPage extends StatelessWidget {
  const WeatherInfoPage({super.key, required this.latLong, this.cityName});

  final String? cityName;
  final LatLong latLong;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> WeatherInfoCubit(latLong: latLong),
        child: _WeatherInfoPage(latLong, cityName));

  }
}

class _WeatherInfoPage extends StatelessWidget {
  const _WeatherInfoPage(this.latLong, this.cityName);

  final LatLong latLong;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradient(
      child: Stack(
        children: [

          /// Weather Info
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: BlocConsumer<WeatherInfoCubit, WeatherInfoStates>(
              listener: (context, state){
                if(state is ErrorState){
                  NetworkUtil.handleNetworkError(context, state.error);
                }
              },

              builder: (context, state){
                if(state is IdleState){
                  return const SizedBox.shrink();

                } else if (state is ErrorState){
                  return const SizedBox.shrink();

                } else if (state is LoadingState){
                  return const LoadingWidget();

                } else if (state is SuccessState){

                  return WeatherView(cityName: cityName, data: state.data,);
                }

                return const SizedBox.shrink();
              },
            ),
          ),

          /// TopBar => Back Button + Search Input Field
          // I added it in a stack in order to show the auto complete list on top
          // of the screen.
          const TopBar(),
        ],
      ),
    );
  }
}

