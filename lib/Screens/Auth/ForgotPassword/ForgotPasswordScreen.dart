import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Layouts/AuthLayout.dart';
import 'package:flutter_app/Ui/Button/CapButton.dart';
import 'package:flutter_app/Ui/Button/CapTextButton.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global/ValidationMixin.dart';
import 'package:flutter_app/Screens/Auth/ForgotPassword/ForgotPasswordController.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> with ValidationMixin
{
  @override
  Widget build(BuildContext context){
    return AuthLayout(
        title: "Forgot password",
        listContent: [
          emailField() ,
          Container( margin: const EdgeInsets.symmetric( vertical: 5.0) ),
          Container( margin: const EdgeInsets.symmetric( vertical: 5.0) ),
          submitButton( context ) ,
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

  Widget loginLink() {
    return CapFullWidth(
      child: CapTextButton(
        text: const Text("Log in"),
        onPressed: () => controller.loading.value ? null : Get.offAndToNamed( Routes.LOGIN )  ,
        color: CapTheme.secondary,
      ),
    );
  }

  Widget submitButton( BuildContext context ) {
    return SizedBox(
        width: double.infinity,
        child: Obx( () => CapButton.stateFull(
          text: 'Forgot password',
          onPressed: () => controller.forgotPassword( context ) ,
          color: CapTheme.danger ,
          loading: controller.loading.value ,
        ),
        )
    ) ;
  }

}
