import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/constance.dart';
import 'package:shopping/core/view_model/home_view_model.dart';
import 'package:shopping/view/detail_view.dart';

import 'package:shopping/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                child: Column(
                  children: [
                    _searchTextFormField(),
                    SizedBox(height: 25.0),
                    CustomText(
                      text: "Categories",
                    ),
                    _listViewCategory(),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                          },
                          child: CustomText(
                            text: 'Best Selling',
                            fontSize: 18.0,
                          ),
                        ),
                        CustomText(
                          text: "See all",
                          fontSize: 16.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    ListViewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100.0,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (_, i) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categories[i].image),
                  ),
                ),
                SizedBox(height: 15.0),
                CustomText(
                  text: controller.categories[i].name,
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 20.0);
          },
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350.0,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (_) => DetailView(
                    model: controller.products[i],
                  ),
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width * .4,
                            child: Hero(
                              tag: controller.products[i].image,
                              child: Image.network(
                                controller.products[i].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          CustomText(
                            text: "${controller.products[i].name}",
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(height: 10.0),
                          CustomText(
                            maxLine: 1,
                            text: "${controller.products[i].description}",
                            alignment: Alignment.bottomLeft,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 20.0),
                          CustomText(
                            text: "\$${controller.products[i].price}",
                            alignment: Alignment.bottomLeft,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 20.0);
          },
        ),
      ),
    );
  }
}
