import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/model/user_model.dart';

import '../constance.dart';

class LocalStorageData extends GetxController {
  setUser(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(CASHED_USER_DATA, json.encode(user.toJson()));
  }

  _getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(CASHED_USER_DATA);
    return UserModel.fromJson(json.decode(value));
  }

  Future<UserModel> get getUserData async {
    try {
      UserModel userModel = await _getUser();
      if (userModel == null) return null;
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
