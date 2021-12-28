import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Layouts/AuthLayout.dart';
import 'package:flutter_app/Screens/Auth/Register/RegisterController.dart';
import 'package:flutter_app/Ui/Button/CapButton.dart';
import 'package:flutter_app/Ui/Button/CapTextButton.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global/ValidationMixin.dart';

class RegisterScreen extends GetView<RegisterController> with ValidationMixin
{
  @override
  Widget build(BuildContext context){
    return AuthLayout(
      title: "Register",
      listContent: [
        Obx( () => firstNameField() ) ,
        Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
        Obx( () => lastNameField() ),
        Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
        Obx( () => emailField() ),
        Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
        Obx( () => passwordField() ),
        Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
        submitButton( context ),
        loginLink() ,
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

  Widget firstNameField() {
    return TextFormField(
      style: CapTheme.textInputStyle(),
      initialValue: controller.lastName.value ,
      keyboardType: TextInputType.emailAddress ,
      decoration:  CapTheme.solidInputDecoration("Enter your first name")  ,
      validator: validateName,
      onChanged: controller.updateLastName ,
    );
  }

  Widget lastNameField() {
    return TextFormField(
      style: CapTheme.textInputStyle(),
      initialValue: controller.firstName.value ,
      keyboardType: TextInputType.emailAddress ,
      decoration:  CapTheme.solidInputDecoration("Enter your last name")  ,
      validator: validateName,
      onChanged: controller.updateFirstName ,
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
    ) ;
  }

  Widget submitButton( BuildContext context ) {
    return SizedBox(
      width: double.infinity,
      child: Obx( () => CapButton.stateFull(
          text: 'Register',
          onPressed: () => controller.register( context ) ,
          color: CapTheme.danger ,
          loading: controller.loading.value ,
        ),
      )
    ) ;
  }

  Widget loginLink() {
    return CapFullWidth(
      child: CapTextButton(
        text: const Text("Log in"),
        onPressed: () => controller.loading.value ? null : Get.offAndToNamed( Routes.LOGIN )  ,
        color: CapTheme.secondary,
      ),
    );
  }

}
