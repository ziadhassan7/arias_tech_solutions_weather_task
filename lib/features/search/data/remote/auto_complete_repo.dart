import 'package:arias_tech_solutions_weather_task/core/api_provider/api_provider.dart';
import 'package:arias_tech_solutions_weather_task/core/dotenv/dotenv_client.dart';
import 'package:dio/dio.dart';
import '../../../../core/custom_log.dart';
import 'auto_complete_list_model.dart';

class SearchRepo {

  final DioClient _dio = DioClient(baseUrl: 'https://maps.googleapis.com/maps/api/');


  Future<AutoCompleteListModel> getAutoCompleteList(String input) async {
    try{
      Response response = await _dio.get(
          'place/autocomplete/json',
          queryParameters: {
            'input': input,
            'key': DotEnvClient.mapKey
          }
      );

      return AutoCompleteListModel.fromJson(response.data);

    } on DioException catch(e){
      Log('autocomplete - Error', e.response);
      rethrow;
    }
  }

}