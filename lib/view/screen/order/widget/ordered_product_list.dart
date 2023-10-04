import 'package:flutter/material.dart';
import 'package:srhdp_psharmuslim/provider/order_provider.dart';
import 'package:srhdp_psharmuslim/view/basewidget/show_custom_snakbar.dart';
import 'package:srhdp_psharmuslim/view/screen/order/widget/order_details_widget.dart';

class OrderProductList extends StatelessWidget {
  final OrderProvider? order;
  final String? orderType;
  const OrderProductList({Key? key, this.order, this.orderType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount:
      order!.orderDetails!.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) => OrderDetailsWidget(orderDetailsModel: order!.orderDetails![i],
          callback: () {showCustomSnackBar('Review submitted successfully', context, isError: false);},
          orderType: orderType!, paymentStatus: order!.trackingModel!.paymentStatus!),
    );
  }
}
