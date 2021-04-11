import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/constance.dart';
import 'package:shopping/core/view_model/auth_view_model.dart';
import 'package:shopping/view/auth/register_view.dart';
import 'package:shopping/view/widgets/custom_button.dart';
import 'package:shopping/view/widgets/custom_button_social.dart';
import 'package:shopping/view/widgets/custom_text.dart';
import 'package:shopping/view/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(RegisterView()),
                    child: CustomText(
                      text: "Sign Up",
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomText(
                text: "Sign in to Continue",
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                text: "Email",
                hintText: "Example@gmail.com",
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) return "error";
                },
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: "Password",
                hintText: "***********",
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) return "error";
                },
              ),
              SizedBox(height: 20),
              CustomText(
                text: "Forgot Password?",
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "SIGN IN",
                onpressed: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate())
                    controller.signInWithEmailAndPassword();
                },
              ),
              SizedBox(height: 20),
              CustomText(
                text: "-OR-",
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              CustomButtonSocial(
                text: "Sign In with Facebook",
                assetName: 'assets/images/facebook.png',
                onPressed: () {
                  controller.signInWithFacebook();
                },
              ),
              SizedBox(height: 20),
              CustomButtonSocial(
                text: "Sign In with Google",
                assetName: 'assets/images/google.png',
                onPressed: () {
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
