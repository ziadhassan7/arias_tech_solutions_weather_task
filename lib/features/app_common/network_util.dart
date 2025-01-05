import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../weather/presentation/dialogs/network_error_dialog.dart';
import 'custom_dialog.dart';

class NetworkUtil {

  static handleNetworkError(BuildContext context, DioException e) {
    // IF the error is a connection error , show a friendly dialog
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionTimeout) {
      CustomDialog.show(context, view: const NetworkErrorDialog());
    }
  }
}