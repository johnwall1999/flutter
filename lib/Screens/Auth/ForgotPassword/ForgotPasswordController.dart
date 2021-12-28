import 'package:flutter/material.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Core/AuthControllerCore.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends AuthControllerCore {

  final ApiService _apiService = Get.find<ApiService>() ;

  var loading = false.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updateEmail( String? value ) => email.value = value ?? '' ;

  Future<bool> forgotPassword( BuildContext context ) async {

    loading.value = true ;

    var res =  await _apiService.post( url: "/api/user/forgot-password" ,payload: { 'email' : email.value } );

    if( res.runtimeType == BadResponse )
    {
      res as BadResponse ;
      dangerToast( context: context ,title: "Error" ,message:  res.error ) ;
      email.value = '';
      loading.value = false ;
      return false ;
    }
    else
    {
      res as GoodResponse ;
      successToast( context: context ,title: "Success" ,message: "Forgot password link sent to your email address!" ) ;
      email.value = '';
      loading.value = false ;
      Get.offAndToNamed( Routes.LOGIN ) ;
      return true ;
    }

  }

}