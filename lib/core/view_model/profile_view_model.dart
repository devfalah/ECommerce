import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping/helper/local_storage_data.dart';
import 'package:shopping/model/user_model.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  final LocalStorageData localStorageData = Get.find();
  UserModel get userModel => _userModel;
  UserModel _userModel;
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUserData.then((user) => _userModel = user);
    _loading.value = false;

    update();
  }
}
