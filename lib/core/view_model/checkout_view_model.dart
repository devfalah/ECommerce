import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/service/firestore_user.dart';
import 'package:shopping/core/view_model/cart_view_model.dart';
import 'package:shopping/core/view_model/profile_view_model.dart';
import 'package:shopping/helper/enum.dart';
import 'package:shopping/helper/extenstion.dart';
import 'package:shopping/model/address_model.dart';
import 'package:shopping/model/order_model.dart';
import 'package:shopping/view/control_view.dart';

import '../../constance.dart';

class CheckoutViewModel extends GetxController {
  Delivery _groubValue = Delivery.StandardDelivery;
  Delivery get groubValue => _groubValue;
  String street1, street2, city, state, contry;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileViewModel profileViewModel = ProfileViewModel();
  CartViewModel cartViewModel = CartViewModel();

  int _processIndex = 0;
  int get processIndex => _processIndex;
  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;
  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.DeliveryTime;
      _processIndex = i;
    } else if (i == 1) {
      _pages = Pages.AddAddress;
      _processIndex = i;
    } else if (i == 2) {
      formKey.currentState.save();
      if (formKey.currentState.validate()) {
        _pages = Pages.Summary;
        _processIndex = i;
      }
    } else if (i == 3) {
      addOrder(
        OrderModel(
          userId: profileViewModel.userModel.userId,
          address: AddressModel(
            street1: street1,
            street2: street2,
            city: city,
            state: state,
            contry: contry,
          ),
          cartModels: cartViewModel.cartModels,
          dateTime: DateTime.now().toIso8601String(),
          delivery: _groubValue.getDeliveryString,
        ),
      );
      Get.to(ControlView());
      _processIndex = 0;
      _pages = Pages.DeliveryTime;
    }
    update();
  }

  changeValueofRadio(value) {
    _groubValue = value;
    update();
  }

  addOrder(OrderModel orderModel) async {
    await FireStoreUser().addOrderToFirestor(orderModel);
  }
}
