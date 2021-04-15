import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/view_model/checkout_view_model.dart';
import 'package:shopping/view/widgets/custom_text.dart';
import 'package:shopping/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formKey,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.0),
                  CustomText(
                    text: 'Billing address is the same as delivery address',
                    fontSize: 16.0,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 25.0),
                  CustomTextFormField(
                    text: 'Street 1',
                    hintText: '21, Alex Davidson Avenue',
                    onSave: (value) {
                      controller.street1 = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty)
                        return "Please Enter avalid value";
                    },
                  ),
                  SizedBox(height: 35.0),
                  CustomTextFormField(
                    text: 'Street 2',
                    hintText: 'Opposite Omegatron, Vicent Quarters',
                    onSave: (value) {
                      controller.street2 = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty)
                        return "Please Enter avalid value";
                    },
                  ),
                  SizedBox(height: 35.0),
                  CustomTextFormField(
                    text: 'City',
                    hintText: 'Victoria Island',
                    onSave: (value) {
                      controller.city = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty)
                        return "Please Enter avalid value";
                    },
                  ),
                  SizedBox(height: 35.0),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          text: 'State',
                          hintText: 'Lagos State',
                          onSave: (value) {
                            controller.state = value;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty)
                              return "Please Enter avalid value";
                          },
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: CustomTextFormField(
                          text: 'Country',
                          hintText: 'Nigeria',
                          onSave: (value) {
                            controller.contry = value;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty)
                              return "Please Enter avalid value";
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
