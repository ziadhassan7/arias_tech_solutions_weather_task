import 'package:arias_tech_solutions_weather_task/core/api_provider/api_provider.dart';
import 'package:arias_tech_solutions_weather_task/core/dotenv/dotenv_client.dart';
import 'package:dio/dio.dart';
import '../../../core/custom_log.dart';

class WeatherRepo {

  final DioClient _dio = DioClient(baseUrl: 'https://api.openweathermap.org/data/2.5/');


  getWeatherByCityName(String name) async {
    try{
      Response response = await _dio.get(
        'find',
        queryParameters: {
          'q': name,
          'appid': DotEnvClient.weatherKey
        }
      );

      return response.data;

    } on DioException catch(e){
      Log('getWeatherByCityName - Error', e.response);
    }
  }

  getWeatherByLatLong(String name) async {
    try{
      Response response = await _dio.get(
          'weather',
          queryParameters: {
            'q': name,
            'appid': DotEnvClient.weatherKey
          }
      );

      return response.data;

    } on DioException catch(e){
      Log('getWeatherByLatLong - Error', e.response);
    }
  }

}