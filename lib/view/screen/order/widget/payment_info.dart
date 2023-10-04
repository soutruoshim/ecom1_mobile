
import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/provider/order_provider.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';

class PaymentInfo extends StatelessWidget {
  final OrderProvider? order;
  const PaymentInfo({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(color: Theme.of(context).highlightColor),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getTranslated('PAYMENT', context)!, style: robotoBold),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(getTranslated('PAYMENT_STATUS', context)!,
                        style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),

                    Text((order!.trackingModel!.paymentStatus != null && order!.trackingModel!.paymentStatus!.isNotEmpty) ?
                    order!.trackingModel!.paymentStatus! : 'Digital Payment',
                      style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                    ),
                  ]),
            ),


            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('PAYMENT_PLATFORM', context)!,
                  style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),

              Text(order!.trackingModel!.paymentMethod != null ? getTranslated( order!.trackingModel!.paymentMethod, context)!: '',
                  style: titilliumBold.copyWith(color: Theme.of(context).primaryColor,
                  )),
            ]),
          ]),
    );
  }
}
