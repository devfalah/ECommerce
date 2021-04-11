import 'package:flutter/material.dart';
import 'package:shopping/helper/extenstion.dart';

class ProductModel {
  ProductModel({
    this.name,
    this.image,
    this.description,
    this.color,
    this.sized,
    this.price,
    this.productId,
  });

  String name;
  String image;
  String description;
  Color color;
  String sized;
  String price;
  String productId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        color: HexColor.fromHex(json["color"]),
        sized: json["sized"],
        price: json["price"],
        productId: json["productId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "color": color,
        "sized": sized,
        "price": price,
        "productId": productId,
      };
}
