import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/base/api_response.dart';
import 'package:srhdp_psharmuslim/data/model/response/coupon_model.dart';
import 'package:srhdp_psharmuslim/data/repository/coupon_repo.dart';
import 'package:srhdp_psharmuslim/helper/price_converter.dart';
import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/view/basewidget/show_custom_snakbar.dart';

class CouponProvider extends ChangeNotifier {
  final CouponRepo? couponRepo;
  CouponProvider({required this.couponRepo});

  CouponModel? _coupon;
  double? _discount;
  bool _isLoading = false;
  CouponModel? get coupon => _coupon;
  double? get discount => _discount;
  bool get isLoading => _isLoading;
  String _couponCode = '';
  String get couponCode => _couponCode;

  Future<void> initCoupon(BuildContext context,String coupon, double order) async {
    _isLoading = true;
    _discount = 0;
    notifyListeners();
    ApiResponse apiResponse = await couponRepo!.getCoupon(coupon);
    if (apiResponse.response != null  && apiResponse.response!.statusCode == 200) {
      _isLoading = false;
      _couponCode = coupon;
      Map map = apiResponse.response!.data;
      String dis = map['coupon_discount'].toString();
      if(map['coupon_discount'] !=null){
        _discount = double.parse(dis);
      }
      if(context.mounted){

      }
      showCustomSnackBar('${getTranslated('you_got', context)} '
          '${PriceConverter.convertPrice(context, _discount)} '
          '${getTranslated('discount', context)}', context, isError: false);
    } else {
      if(context.mounted){

      }
      showCustomSnackBar(apiResponse.response!.data, context, isToaster: true);
    }
    _isLoading = false;
    notifyListeners();
  }

  void removePrevCouponData() {
    _coupon = null;
    _isLoading = false;
    _discount = null;
    _coupon = null;
  }
}
