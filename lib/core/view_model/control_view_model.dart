import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping/view/cart_view.dart';
import 'package:shopping/view/home_view.dart';
import 'package:shopping/view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget currentView = HomeView();
  int get navigatorValue => _navigatorValue;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        currentView = HomeView();
        break;
      case 1:
        currentView = CartView();
        break;
      case 2:
        currentView = ProfileView();
        break;
    }
    update();
  }
}
