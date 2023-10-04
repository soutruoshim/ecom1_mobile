import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/localization/language_constrants.dart';
import 'package:srhdp_psharmuslim/provider/brand_provider.dart';
import 'package:srhdp_psharmuslim/provider/category_provider.dart';
import 'package:srhdp_psharmuslim/provider/featured_deal_provider.dart';
import 'package:srhdp_psharmuslim/provider/home_category_product_provider.dart';
import 'package:srhdp_psharmuslim/provider/localization_provider.dart';
import 'package:srhdp_psharmuslim/provider/product_provider.dart';
import 'package:srhdp_psharmuslim/provider/splash_provider.dart';
import 'package:srhdp_psharmuslim/provider/top_seller_provider.dart';
import 'package:srhdp_psharmuslim/utill/app_constants.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:provider/provider.dart';

class CurrencyDialog extends StatelessWidget {
  final bool isCurrency;
  const CurrencyDialog({Key? key, this.isCurrency = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? index;
    if(isCurrency) {
      index = Provider.of<SplashProvider>(context, listen: false).currencyIndex;
    }else {
      index = Provider.of<LocalizationProvider>(context, listen: false).languageIndex;
    }

    return Dialog(
      backgroundColor: Theme.of(context).highlightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [

        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Text(isCurrency ? getTranslated('currency', context)! : getTranslated('language', context)!,
              style: titilliumSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),),

        SizedBox(height: 150, child: Consumer<SplashProvider>(
          builder: (context, splash, child) {
            List<String?> valueList = [];
            if(isCurrency) {
              for (var currency in splash.configModel!.currencyList!) {
                valueList.add(currency.name);
              }
            }else {
              for (var language in AppConstants.languages) {
                valueList.add(language.languageName);
              }
            }
            return CupertinoPicker(
              itemExtent: 40,
              useMagnifier: true,
              magnification: 1.2,
              scrollController: FixedExtentScrollController(initialItem: index!),
              onSelectedItemChanged: (int i) {
                index = i;
              },
              children: valueList.map((value) {
                return Center(child: Text(value!, style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color)));
              }).toList(),
            );
          },
        )),

        const Divider(height: Dimensions.paddingSizeExtraSmall, color: ColorResources.hintTextColor),
        Row(children: [
          Expanded(child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(getTranslated('CANCEL', context)!, style: robotoRegular.copyWith(color: ColorResources.getYellow(context))),
          )),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
            child: VerticalDivider(width: Dimensions.paddingSizeExtraSmall, color: Theme.of(context).hintColor),
          ),
          Expanded(child: TextButton(
            onPressed: () {
              if(isCurrency) {
                Provider.of<SplashProvider>(context, listen: false).setCurrency(index!);
              }else {
                Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                  AppConstants.languages[index!].languageCode!,
                  AppConstants.languages[index!].countryCode,
                ));
                Provider.of<CategoryProvider>(context, listen: false).getCategoryList(true);
                Provider.of<HomeCategoryProductProvider>(context, listen: false).getHomeCategoryProductList(true);
                Provider.of<TopSellerProvider>(context, listen: false).getTopSellerList(true);
                Provider.of<BrandProvider>(context, listen: false).getBrandList(true);
                Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, reload: true);
                Provider.of<ProductProvider>(context, listen: false).getFeaturedProductList('1', reload: true);
                Provider.of<FeaturedDealProvider>(context, listen: false).getFeaturedDealList(true);
                Provider.of<ProductProvider>(context, listen: false).getLProductList('1', reload: true);
              }
              Navigator.pop(context);
            },
            child: Text(getTranslated('ok', context)!, style: robotoRegular.copyWith(color: ColorResources.getGreen(context))),
          )),
        ]),

      ]),
    );
  }
}