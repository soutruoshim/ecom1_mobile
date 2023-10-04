import 'package:srhdp_psharmuslim/data/datasource/remote/dio/dio_client.dart';
import 'package:srhdp_psharmuslim/data/datasource/remote/exception/api_error_handler.dart';
import 'package:srhdp_psharmuslim/data/model/response/base/api_response.dart';
import 'package:srhdp_psharmuslim/utill/app_constants.dart';

class CouponRepo {
  final DioClient? dioClient;
  CouponRepo({required this.dioClient});

  Future<ApiResponse> getCoupon(String coupon) async {
    try {
      final response = await dioClient!.get('${AppConstants.couponUri}$coupon');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}