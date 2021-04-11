import 'package:shopping/constance.dart';

class CartModel {
  CartModel({
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.productId,
  });

  String name;
  String image;
  int quantity;
  String price;
  String productId;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        name: json["$columnName"] ?? "",
        image: json["$columnImage"] ?? "",
        price: json["$columnPrice"] ?? "",
        quantity: json["$columnQuantity"] ?? 1,
        productId: json["productId"] ?? "",
      );

  Map<String, Object> toJson() => {
        "$columnName": name,
        "$columnImage": image,
        "$columnPrice": price,
        "$columnQuantity": quantity,
        "productId": productId,
      };
}
