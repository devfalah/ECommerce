import 'package:get/get.dart';
import 'package:shopping/core/view_model/auth_view_model.dart';
import 'package:shopping/core/view_model/cart_view_model.dart';
import 'package:shopping/core/view_model/checkout_view_model.dart';
import 'package:shopping/core/view_model/control_view_model.dart';
import 'package:shopping/core/view_model/home_view_model.dart';
import 'package:shopping/core/view_model/profile_view_model.dart';
import 'package:shopping/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    Get.lazyPut<ControlViewModel>(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckoutViewModel());
  }
}
