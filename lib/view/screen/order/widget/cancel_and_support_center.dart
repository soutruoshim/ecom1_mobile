import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/order_model.dart';
import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/provider/order_provider.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:srhdp_psharmuslim/view/basewidget/button/custom_button.dart';
import 'package:srhdp_psharmuslim/view/screen/support/support_ticket_screen.dart';
import 'package:srhdp_psharmuslim/view/screen/tracking/tracking_screen.dart';
import 'package:provider/provider.dart';

class CancelAndSupport extends StatelessWidget {
  final OrderModel? orderModel;
  final bool fromNotification;
  const CancelAndSupport({Key? key, this.orderModel, this.fromNotification = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeSmall,
          vertical: Dimensions.paddingSizeSmall),
      child: Row(children: [Expanded(child: orderModel != null &&
          orderModel!.orderStatus =='pending' && orderModel!.orderType != "POS" || fromNotification?

      CustomButton(buttonText: getTranslated('cancel_order', context),
          onTap: () => Provider.of<OrderProvider>(context,listen: false).cancelOrder(context, orderModel!.id).then((value) {
            if(value.response!.statusCode == 200){
              Provider.of<OrderProvider>(context, listen: false).initOrderList(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(getTranslated('order_cancelled_successfully', context)!),
                backgroundColor: Colors.green,));
            }
          })) :

      CustomButton(buttonText: getTranslated('TRACK_ORDER', context),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TrackingScreen(orderID: orderModel!.id.toString()))),),),
        const SizedBox(width: Dimensions.paddingSizeSmall),


        Expanded(child: SizedBox(height: 45,
          child: TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SupportTicketScreen())),
            style: TextButton.styleFrom(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: ColorResources.getPrimary(context)),
            )),
            child: Text(getTranslated('SUPPORT_CENTER', context)!,
              style: titilliumSemiBold.copyWith(fontSize: 16, color: ColorResources.getPrimary(context)),),
          ),
        ),
        ),
      ],
      ),
    );
  }
}
