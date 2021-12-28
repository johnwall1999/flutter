import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Layouts/AuthLayout.dart';
import 'package:flutter_app/Ui/Button/CapButton.dart';
import 'package:flutter_app/Ui/Button/CapTextButton.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global/ValidationMixin.dart';
import 'package:flutter_app/Screens/Auth/Login/LoginController.dart';

class LoginScreen extends GetView<LoginController> with ValidationMixin
{
  @override
  Widget build(BuildContext context){
    return AuthLayout(
      title: "Login",
      listContent: [
        emailField() ,
        Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
        passwordField() ,
        Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
        forgotPasswordLink() ,
        submitButton( context ) ,
        registerButton() ,
      ]
    );
  }

  Widget emailField() {
    return TextFormField(
      style: CapTheme.textInputStyle(),
      initialValue: controller.email.value ,
      keyboardType: TextInputType.emailAddress ,
      decoration:  CapTheme.solidInputDecoration("Enter your email address")  ,
      validator: validateEmail,
      onChanged: controller.updateEmail ,
    );
  }

  Widget passwordField() {
    return TextFormField(
      style: CapTheme.textInputStyle(),
      initialValue: controller.password.value ,
      obscureText: true,
      keyboardType: TextInputType.emailAddress ,
      decoration:  CapTheme.solidInputDecoration("Enter your password")  ,
      validator: validatePassword,
      onChanged: controller.updatePassword ,
    );
  }

  Widget submitButton( BuildContext context ) {
    return SizedBox(
      width: double.infinity,
      child:  Obx( () => CapButton.stateFull(
        text: 'Login',
        onPressed: () => controller.login( context ) ,
        color: CapTheme.danger ,
        loading: controller.loading.value ,
      ),
      )
    ) ;
  }

  Widget registerButton() {
    return SizedBox(
      width: double.infinity,
      child: CapButton(
        text: 'Register',
        onPressed: () => Get.offAndToNamed( Routes.REGISTER )  ,
        color: CapTheme.primary ,
      ) ,
    ) ;
  }

  Widget forgotPasswordLink() {
    return CapFullWidth(
      child: CapTextButton(
        text: const Text("Forgot password?" ,style: CapTheme.textButtonStyle ),
        onPressed: () => Get.offAndToNamed( Routes.FORGOT_PASSWORD )  ,
        color: CapTheme.secondary,
      ),
    );
  }

}
