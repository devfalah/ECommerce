import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping/core/service/database/card_database_helper.dart';
import 'package:shopping/model/cart_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CartModel> _cartModels = [];
  List<CartModel> get cartModels => _cartModels;
  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
  var db = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProducts();
  }
  addProduct(CartModel cartProduct) async {
    for (var cart in _cartModels) {
      if (cart.productId == cartProduct.productId) return;
    }

    await db.insertProduct(cartProduct);
    _cartModels.add(cartProduct);
    _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);

    update();
  }

  getAllProducts() async {
    _loading.value = true;

    _cartModels = await db.getAllProducts();

    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (var cart in _cartModels) {
      _totalPrice += (double.parse(cart.price) * cart.quantity);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartModels[index].quantity++;
    _totalPrice += (double.parse(_cartModels[index].price));
    await db.updateCart(_cartModels[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartModels[index].quantity > 1) {
      _cartModels[index].quantity--;
      _totalPrice -= (double.parse(_cartModels[index].price));
      await db.updateCart(_cartModels[index]);
      update();
    }
  }
}
