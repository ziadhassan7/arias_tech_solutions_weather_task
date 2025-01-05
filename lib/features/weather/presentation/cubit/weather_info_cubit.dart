import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/data/weather_model.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/data/weather_repo.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/cubit/weather_info_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WeatherInfoCubit extends Cubit<WeatherInfoStates>{
  final LatLong latLong;

  WeatherInfoCubit({required this.latLong}) : super(IdleState()){
    getWeather(latLong: latLong);
  }


  getWeather({required LatLong latLong,}) async {

    //Start Loading
    emit(LoadingState());

    try {

      WeatherModel data = await WeatherRepo().getWeatherByLatLong(
        latLong,
      );

      emit(SuccessState(data: data));

    } on DioException catch (e) {
      emit(ErrorState(error: e));
    }
  }

}
