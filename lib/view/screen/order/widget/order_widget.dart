import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/order_model.dart';
import 'package:srhdp_psharmuslim/helper/date_converter.dart';
import 'package:srhdp_psharmuslim/helper/price_converter.dart';
import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:srhdp_psharmuslim/view/screen/order/order_details_screen.dart';


class OrderWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const OrderWidget({Key? key, this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(
                orderId: orderModel!.id, orderType: orderModel!.orderType,
                extraDiscount: orderModel!.extraDiscount,
                extraDiscountType: orderModel!.extraDiscountType)));},


      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall,
            left: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(5)),


        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(getTranslated('ORDER_ID', context)!,
                    style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Text(orderModel!.id.toString(), style: titilliumSemiBold),
              ]),


              const SizedBox(height: Dimensions.paddingSizeSmall),

              Row(children: [
                Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(orderModel!.createdAt!)),
                    style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                      color: Theme.of(context).hintColor,
                )),
              ]),

            ]),
            const SizedBox(width: Dimensions.paddingSizeLarge),



            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(getTranslated('total_price', context)!,
                    style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                Text(PriceConverter.convertPrice(context, orderModel!.orderAmount), style: titilliumSemiBold),
              ]),
            ),



            Container(alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,vertical: Dimensions.paddingSizeSmall),
              decoration: BoxDecoration(
                color: ColorResources.getLowGreen(context),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(getTranslated('${orderModel!.orderStatus}', context)!, style: titilliumSemiBold),
            ),

          ]),
        ),
      ),
    );
  }
}
