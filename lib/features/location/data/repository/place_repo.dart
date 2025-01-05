import 'package:arias_tech_solutions_weather_task/core/api_provider/api_provider.dart';
import 'package:arias_tech_solutions_weather_task/core/dotenv/dotenv_client.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/place_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/custom_log.dart';


class PlaceRepo {

  final DioClient _dio = DioClient(baseUrl: 'https://maps.googleapis.com/maps/api/');


  Future<PlaceModel> getLatLongByPlaceId(String placeId) async {
    try{
      Response response = await _dio.get(
          'geocode/json',
          queryParameters: {
            'place_id': placeId,
            'key': DotEnvClient.mapKey
          }
      );

      return PlaceModel.fromJson(response.data);

    } on DioException catch(e){
      Log('getLatLongByPlaceId - Error', e.response);
      rethrow;
    }
  }

  Future<PlaceModel> getLatLongByAddress(String address) async {
    try{
      Response response = await _dio.get(
          'geocode/json',
          queryParameters: {
            'address': address,
            'key': DotEnvClient.mapKey
          }
      );

      return PlaceModel.fromJson(response.data);

    } on DioException catch(e){
      Log('getLatLongByAddress - Error', e.response);
      rethrow;
    }
  }

}