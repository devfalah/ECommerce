import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/view_model/auth_view_model.dart';
import 'package:shopping/core/view_model/control_view_model.dart';
import 'package:shopping/view/auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user == null)
            ? LoginView()
            : GetBuilder<ControlViewModel>(
                init: ControlViewModel(),
                builder: (controller) => Scaffold(
                  body: controller.currentView,
                  bottomNavigationBar: bottomNavigationBar(),
                ),
              );
      },
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: _customNavText("Explore"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset('assets/images/Icon_Explore.png'),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Column(
                children: [
                  _customNavText("Cart"),
                ],
              ),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset('assets/images/Icon_Cart.png'),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: _customNavText("Account"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset('assets/images/Icon_User.png'),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue ?? 0,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }

  Text _customNavText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
