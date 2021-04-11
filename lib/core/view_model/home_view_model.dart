import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/service/home_services.dart';
import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  HomeViewModel() {
    getCategories();
    getBestSelling();
  }

  getCategories() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (var i in value) {
        _categories.add(CategoryModel.fromJson(i.data()));
      }
      _loading.value = false;
      update();
    });
  }

  getBestSelling() async {
    _loading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (var i in value) {
        _products.add(ProductModel.fromJson(i.data()));
      }
      _loading.value = false;
      update();
    });
  }
}
