import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/constance.dart';
import 'package:shopping/core/view_model/cart_view_model.dart';
import 'package:shopping/model/cart_model.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view/widgets/custom_button.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class DetailView extends StatelessWidget {
  final ProductModel model;

  const DetailView({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: model.image,
                    child: Image.network(
                      model.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 50.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.stars,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontSize: 26,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 16.0),
                            width: MediaQuery.of(context).size.width * .4,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Size",
                                ),
                                CustomText(
                                  text: model.sized,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 46,
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: CustomText(
                                    text: "Color",
                                  ),
                                ),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: model.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      CustomText(
                        text: "Detail",
                      ),
                      SizedBox(height: 15),
                      CustomText(
                        height: 1.8,
                        text: model.description,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                          text: "PRICE", fontSize: 12, color: Colors.grey),
                      CustomText(
                        text: model.price + "\$",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => Container(
                      height: 50,
                      width: 146,
                      child: CustomButton(
                        text: 'ADD',
                        onpressed: () => controller.addProduct(
                          CartModel(
                            name: model.name,
                            image: model.image,
                            price: model.price,
                            quantity: 1,
                            productId: model.productId,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
