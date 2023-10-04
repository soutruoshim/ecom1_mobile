import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/data/model/response/chat_model.dart';
import 'package:srhdp_psharmuslim/helper/date_converter.dart';
import 'package:srhdp_psharmuslim/provider/chat_provider.dart';
import 'package:srhdp_psharmuslim/provider/splash_provider.dart';
import 'package:srhdp_psharmuslim/utill/color_resources.dart';
import 'package:srhdp_psharmuslim/utill/custom_themes.dart';
import 'package:srhdp_psharmuslim/utill/dimensions.dart';
import 'package:srhdp_psharmuslim/view/basewidget/custom_image.dart';
import 'package:srhdp_psharmuslim/view/screen/chat/chat_screen.dart';
import 'package:provider/provider.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat? chat;
  const ChatItemWidget({Key? key, this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? baseUrl = Provider.of<ChatProvider>(context, listen: false).userTypeIndex == 0 ?
    Provider.of<SplashProvider>(context, listen: false).baseUrls!.shopImageUrl:
    Provider.of<SplashProvider>(context, listen: false).baseUrls!.deliveryManImage;
    String? image = Provider.of<ChatProvider>(context, listen: false).userTypeIndex == 0 ?
    chat!.sellerInfo != null? chat!.sellerInfo?.shops![0].image :'' : chat!.deliveryMan!.image;

    int? id = Provider.of<ChatProvider>(context, listen: false).userTypeIndex == 0 ?
    chat!.sellerId : chat!.deliveryManId;
    String name = Provider.of<ChatProvider>(context, listen: false).userTypeIndex == 0 ?
    chat!.sellerInfo != null ? chat!.sellerInfo!.shops![0].name! : 'Shop not found': "${chat!.deliveryMan!.fName!} ${chat!.deliveryMan!.lName!}";

    
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: Container(
              color: Theme.of(context).highlightColor,
              child: CustomImage(image: '$baseUrl/$image'))),

          title: Text(name, style: titilliumSemiBold),

          subtitle: Text(chat!.message!, maxLines: 4,overflow: TextOverflow.ellipsis,
              style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),

          trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(chat!.createdAt!)),
                style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),

          ]),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ChatScreen(id: id, name: name,);
          })),
        ),
        const Divider(height: 2, color: ColorResources.chatIconColor),
      ],
    );
  }
}
