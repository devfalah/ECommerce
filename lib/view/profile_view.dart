import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/view_model/profile_view_model.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(60),
                                image: DecorationImage(
                                  image: controller.userModel == null
                                      ? AssetImage("assets/images/Avatar.png")
                                      : (controller.userModel.pic == null
                                          ? AssetImage(
                                              "assets/images/Avatar.png")
                                          : NetworkImage(
                                              controller.userModel.pic,
                                            )) as ImageProvider<Object>,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  fontSize: 26,
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text: controller.userModel.email,
                                  fontSize: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 100.0),
                      MenuItemButton(
                        text: 'Edit Profile',
                        imageName: 'Icon_Edit-Profile.png',
                        onTap: () {},
                      ),
                      SizedBox(height: 10.0),
                      MenuItemButton(
                        text: 'Shipping Address',
                        imageName: 'Icon_Location.png',
                        onTap: () {},
                      ),
                      SizedBox(height: 10.0),
                      MenuItemButton(
                        text: 'Order History',
                        imageName: 'Icon_History.png',
                        onTap: () {},
                      ),
                      SizedBox(height: 10.0),
                      MenuItemButton(
                        text: 'Cards',
                        imageName: 'Icon_Payment.png',
                        onTap: () {},
                      ),
                      SizedBox(height: 10.0),
                      MenuItemButton(
                        text: 'Notifications',
                        imageName: 'Icon_Alert.png',
                        onTap: () {},
                      ),
                      SizedBox(height: 10.0),
                      MenuItemButton(
                        text: 'Log Out',
                        imageName: 'Icon_Exit.png',
                        onTap: () {
                          controller.signOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class MenuItemButton extends StatelessWidget {
  final String text, imageName;
  final Function onTap;

  const MenuItemButton({this.text: '', this.imageName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap as void Function(),
      title: CustomText(
        text: "$text",
        fontSize: 18.0,
      ),
      leading: Image.asset(
        "assets/images/$imageName",
        fit: BoxFit.fill,
      ),
      trailing: Icon(
        Icons.navigate_next,
        size: 20.0,
        color: Colors.black,
      ),
    );
  }
}
