import 'package:srhdp_psharmuslim/data/datasource/remote/dio/dio_client.dart';
import 'package:srhdp_psharmuslim/data/datasource/remote/exception/api_error_handler.dart';
import 'package:srhdp_psharmuslim/data/model/response/base/api_response.dart';
import 'package:srhdp_psharmuslim/utill/app_constants.dart';

class FlashDealRepo {
  final DioClient? dioClient;
  FlashDealRepo({required this.dioClient});

  Future<ApiResponse> getFlashDeal() async {
    try {
      final response = await dioClient!.get(AppConstants.flashDealUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getFlashDealList(String productID) async {
    try {
      final response = await dioClient!.get('${AppConstants.flashDealProductUri}$productID');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}