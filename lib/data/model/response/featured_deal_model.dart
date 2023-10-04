
import 'package:srhdp_psharmuslim/data/model/response/product_model.dart';

class FeaturedDealModel {

  Product? product;

  FeaturedDealModel(
      {this.product});

  FeaturedDealModel.fromJson(Map<String, dynamic> json) {

    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}


