import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping/core/service/firestore_user.dart';
import 'package:shopping/helper/local_storage_data.dart';
import 'package:shopping/model/user_model.dart';
import 'package:shopping/view/control_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, name;
  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUser(_auth.currentUser.uid);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken;

      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        getCurrentUser(value.user.uid);
      });

      Get.offAll(ControlView());
    } catch (e) {}
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }

  void saveUser(UserCredential user) async {
    final userModel = UserModel(
      name: name == null ? user.user.displayName : name,
      email: user.user.email,
      userId: user.user.uid,
      pic: user.user.photoURL,
    );
    await FireStoreUser().addUserToFirestor(userModel);
    setUser(userModel);
  }

  void setUser(UserModel user) async {
    await localStorageData.setUser(user);
  }

  void getCurrentUser(String uid) async {
    await FireStoreUser()
        .getUserfromFirestor(uid)
        .then((user) => setUser(UserModel.fromJson(user.data())));
  }
}
