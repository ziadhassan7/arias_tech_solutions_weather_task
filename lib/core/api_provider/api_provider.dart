import 'package:dio/dio.dart';

class DioClient {

  final Dio _dio = Dio();
  final Duration _timeout = const Duration(milliseconds: 10000);

  DioClient({required String baseUrl}) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.responseType = ResponseType.json
      ..options.connectTimeout = _timeout
      ..options.receiveTimeout = _timeout;
  }


  Future<Response> get(
      String url, {
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {

    try {

      final Response response = await _dio.get(
        url,
        options: options,
        queryParameters: queryParameters,
      );
      return response;

    } on DioException catch (e) {
      rethrow;
    }
  }

}