import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/constance.dart';
import 'package:shopping/core/view_model/cart_view_model.dart';
import 'package:shopping/view/widgets/custom_button.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.find(),
              builder: (controller) => Container(
                child: ListView.separated(
                  itemCount: controller.cartModels.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.all(16.0),
                      height: 120,
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.network(
                                controller.cartModels[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.cartModels[index].name,
                                  fontSize: 16.0,
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text:
                                      "\$${controller.cartModels[index].price}",
                                  color: primaryColor,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 30,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.add, size: 15),
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                      ),
                                      SizedBox(width: 20),
                                      CustomText(
                                        alignment: Alignment.center,
                                        text:
                                            "${controller.cartModels[index].quantity}",
                                      ),
                                      SizedBox(width: 20),
                                      GestureDetector(
                                        child: Container(
                                          padding:
                                              EdgeInsets.only(bottom: 10.0),
                                          child: Icon(Icons.minimize, size: 15),
                                        ),
                                        onTap: () {
                                          controller.decreaseQuantity(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(text: "TOTAL", fontSize: 12, color: Colors.grey),
                    GetBuilder<CartViewModel>(
                      builder: (controller) => CustomText(
                        text: "${controller.totalPrice}" + "\$",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 146,
                  child: CustomButton(
                    text: 'CHECKOUT',
                    onpressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
