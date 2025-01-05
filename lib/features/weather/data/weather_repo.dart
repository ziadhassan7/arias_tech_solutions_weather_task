import 'package:arias_tech_solutions_weather_task/core/api_provider/api_provider.dart';
import 'package:arias_tech_solutions_weather_task/core/dotenv/dotenv_client.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/data/weather_model.dart';
import 'package:dio/dio.dart';
import '../../../core/custom_log.dart';

class WeatherRepo {

  final DioClient _dio = DioClient(baseUrl: 'https://api.openweathermap.org/data/3.0/');

  Future<WeatherModel> getWeatherByLatLong(LatLong latLong) async {
    try{
      Response response = await _dio.get(
          'onecall',
          queryParameters: {
            'lat': latLong.lat,
            'lon': latLong.long,
            'units': 'metric', //celsius degrees
            'appid': DotEnvClient.weatherKey
          }
      );

      return WeatherModel.fromJson(response.data);

    } on DioException catch(e){
      Log('getWeatherByLatLong - Error', e.response);
      rethrow;
    }
  }

}