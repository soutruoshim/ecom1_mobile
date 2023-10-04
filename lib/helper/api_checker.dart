import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/base/api_response.dart';
import 'package:srhdp_psharmuslim/main.dart';
import 'package:srhdp_psharmuslim/provider/auth_provider.dart';
import 'package:srhdp_psharmuslim/provider/profile_provider.dart';
import 'package:srhdp_psharmuslim/view/screen/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
      Provider.of<ProfileProvider>(Get.context!,listen: false).clearHomeAddress();
      Provider.of<ProfileProvider>(Get.context!,listen: false).clearOfficeAddress();
      Provider.of<AuthProvider>(Get.context!,listen: false).clearSharedData();
      Navigator.of(Get.context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => false);
    }else {
      if (apiResponse.error is String) {
      } else {
      }
    }
  }
}