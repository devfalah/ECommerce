import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping/constance.dart';
import 'package:shopping/core/view_model/cart_view_model.dart';
import 'package:shopping/core/view_model/checkout_view_model.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 40.0),
            GetBuilder<CartViewModel>(
              builder: (controller) => Container(
                height: 180.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      width: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120.0,
                            width: 120,
                            child: Image.network(
                              controller.cartModels[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          CustomText(
                            text: controller.cartModels[index].name,
                            fontSize: 16,
                            maxLine: 1,
                          ),
                          SizedBox(height: 10.0),
                          CustomText(
                            text:
                                "\$${double.parse(controller.cartModels[index].price) * controller.cartModels[index].quantity}",
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(width: 10.0),
                  itemCount: controller.cartModels.length,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            CustomText(
              text: 'Shipping Address',
              fontSize: 18.0,
            ),
            SizedBox(height: 20.0),
            GetBuilder<CheckoutViewModel>(
              init: Get.find(),
              builder: (controller) => CustomText(
                text: controller.street1 +
                    ", " +
                    controller.street2 +
                    ", " +
                    controller.state +
                    ", " +
                    controller.city +
                    ", " +
                    controller.contry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
