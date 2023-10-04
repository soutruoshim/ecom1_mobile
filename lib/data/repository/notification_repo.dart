import 'package:dio/dio.dart';
import 'package:srhdp_psharmuslim/data/datasource/remote/dio/dio_client.dart';
import 'package:srhdp_psharmuslim/data/datasource/remote/exception/api_error_handler.dart';
import 'package:srhdp_psharmuslim/data/model/response/base/api_response.dart';
import 'package:srhdp_psharmuslim/utill/app_constants.dart';

class NotificationRepo {
  final DioClient? dioClient;
  NotificationRepo({required this.dioClient});

  Future<ApiResponse> getNotificationList() async {
    try {
      Response response = await dioClient!.get(AppConstants.notificationUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}