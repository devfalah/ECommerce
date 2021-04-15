import 'dart:convert';

import 'package:shopping/model/address_model.dart';
import 'package:shopping/model/cart_model.dart';

class OrderModel {
  String userId;
  String dateTime;
  String delivery;
  AddressModel address;
  List<CartModel> cartModels;
  OrderModel({
    this.dateTime,
    this.delivery,
    this.userId,
    this.address,
    this.cartModels,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'delivery': delivery,
      'address': address.toMap(),
      'cartModels': cartModels?.map((x) => x.toJson())?.toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userId: map['userId'] ?? '',
      dateTime: map['dateTime'] ?? '',
      delivery: map['delivery'] ?? '',
      address: AddressModel.fromMap(map['address']) ?? AddressModel(),
      cartModels: List<CartModel>.from(
        map['cartModels']?.map((x) => CartModel.fromJson(x) ?? CartModel()) ??
            const [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
