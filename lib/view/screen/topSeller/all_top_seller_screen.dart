import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/top_seller_model.dart';

import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/provider/theme_provider.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:srhdp_psharmuslim/view/screen/home/widget/top_seller_view.dart';
import 'package:provider/provider.dart';

class AllTopSellerScreen extends StatelessWidget {
  final TopSellerModel? topSeller;
  const AllTopSellerScreen({Key? key, required this.topSeller}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: ColorResources.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(getTranslated('top_seller', context)!,
            style: titilliumRegular.copyWith(fontSize: 20, color: ColorResources.white)),

      ),

      body: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: TopSellerView(isHomePage: false),
      ),
    );
  }
}
