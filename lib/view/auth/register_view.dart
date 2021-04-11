import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/view_model/auth_view_model.dart';
import 'package:shopping/view/auth/login_view.dart';
import 'package:shopping/view/widgets/custom_button.dart';
import 'package:shopping/view/widgets/custom_text.dart';
import 'package:shopping/view/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class RegisterView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.off(LoginView()),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: "Welcome,",
                fontSize: 30,
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                text: "Name",
                hintText: "Enter your name",
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) return "error";
                },
              ),
              SizedBox(height: 40),
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
                text: "SIGN UP",
                onpressed: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate())
                    controller.createUserWithEmailAndPassword();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
