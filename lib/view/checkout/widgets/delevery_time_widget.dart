import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/constance.dart';
import 'package:shopping/core/view_model/checkout_view_model.dart';
import 'package:shopping/helper/enum.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          CustomRadioListTile(
            value: Delivery.StandardDelivery,
            title: "Standard Delivery",
            subTitle: "\nOrder will be delivered between 3 - 5\n business days",
          ),
          SizedBox(height: 50.0),
          CustomRadioListTile(
            value: Delivery.NextDayDelivery,
            title: "Next Day Delivery",
            subTitle:
                "\nPlace your order before 6pm and your items will be delivered the next day",
          ),
          SizedBox(height: 50.0),
          CustomRadioListTile(
            value: Delivery.NominatedDelivery,
            title: "Nominated Delivery",
            subTitle:
                "\nPick a particular date from the calendar and order will be delivered on selected date",
          ),
        ],
      ),
    );
  }
}

class CustomRadioListTile extends StatelessWidget {
  final Delivery value;
  final String title;
  final String subTitle;

  const CustomRadioListTile({
    this.value,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => RadioListTile<Delivery>(
        controlAffinity: ListTileControlAffinity.trailing,
        value: value,
        groupValue: controller.groubValue,
        activeColor: primaryColor,
        title: CustomText(
          text: title,
          fontSize: 24.0,
        ),
        subtitle: CustomText(
          text: subTitle,
          fontSize: 14,
        ),
        onChanged: (value) {
          controller.changeValueofRadio(value);
        },
      ),
    );
  }
}
