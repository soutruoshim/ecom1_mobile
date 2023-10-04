import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/transaction_model.dart';
import 'package:srhdp_psharmuslim/helper/date_converter.dart';
import 'package:srhdp_psharmuslim/helper/price_converter.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
class TransactionWidget extends StatelessWidget {
  final WalletTransactioList? transactionModel;
  const TransactionWidget({Key? key, this.transactionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String type = transactionModel!.transactionType!;
    String? reformatType;
    if (type.contains('_')){
      reformatType = type.replaceAll('_', ' ');
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.homePagePadding,vertical: Dimensions.paddingSizeSmall),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text(PriceConverter.convertPrice(context,
                transactionModel!.credit! > 0 ? transactionModel!.credit: transactionModel!.debit),
              style: robotoRegular.copyWith(color: ColorResources.getTextTitle(context),
                  fontSize: Dimensions.fontSizeLarge),
            ),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall,),


            Text('$reformatType',
              style: robotoRegular.copyWith(color: ColorResources.getHint(context)),
            ),
          ],)),
          Column(crossAxisAlignment: CrossAxisAlignment.end,children: [
            Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(transactionModel!.createdAt!)),
              style: robotoRegular.copyWith(color: ColorResources.getHint(context)),),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall,),


            Text( transactionModel!.credit! > 0 ? 'Credit': 'Debit',
              style: robotoRegular.copyWith(color: transactionModel!.credit! > 0 ? Colors.green: Colors.red),
            ),
          ],),
          ],),
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
            child: Divider(thickness: .4,color: Theme.of(context).hintColor.withOpacity(.8),),
          ),
        ],
      ),);
  }
}
