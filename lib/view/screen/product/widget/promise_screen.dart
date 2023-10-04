import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:srhdp_psharmuslim/utill/images.dart';
class PromiseScreen extends StatelessWidget {
  const PromiseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double  width = MediaQuery.of(context).size.width/8.5;
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Expanded(child: Column(children: [
        SizedBox(width: width, child: Image.asset(Images.sevenDayEasyReturn),),
          Text(getTranslated('seven_days_return', context)!,maxLines: 2,
            overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),],),
      ),
      const SizedBox(width: Dimensions.paddingSizeDefault,),

        Expanded(child: Column(children: [
          SizedBox(width: width, child: Image.asset(Images.safePayment),),
          Text(getTranslated('safe_payment', context)!,
              maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),],),
      ),
      const SizedBox(width: Dimensions.paddingSizeDefault,),


        Expanded(child: Column(children: [
          SizedBox(width: width, child: Image.asset(Images.hundredParAuthentic),),
          Text(getTranslated('authentic_product', context)!,
            maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),],),
        ),
    ],);
  }
}
