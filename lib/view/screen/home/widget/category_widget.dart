import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/category.dart';
import 'package:srhdp_psharmuslim/provider/splash_provider.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:srhdp_psharmuslim/utill/images.dart';
import 'package:provider/provider.dart';
class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Container(
        height: MediaQuery.of(context).size.width/5,
        width: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: Theme.of(context).highlightColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: Images.placeholder,
            image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls!.categoryImageUrl}'
                '/${category.icon}',
            imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover,),
          ),
        ),
      ),

      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
      Center(
        child: Text(category.name!,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
              color: ColorResources.getTextTitle(context)),
        ),
      ),

    ]);
  }
}
