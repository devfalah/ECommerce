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
                                    : controller.userModel == null
                                        ? AssetImage("assets/images/Avatar.png")
                                        : NetworkImage(
                                            controller.userModel.pic),
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
                    ListTile(
                      title: CustomText(
                        text: "Edit Profile",
                        fontSize: 18.0,
                      ),
                      leading: Image.asset(
                        "assets/images/Icon_Edit-Profile.png",
                        fit: BoxFit.fill,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
