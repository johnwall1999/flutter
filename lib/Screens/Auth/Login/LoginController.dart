import 'package:flutter/material.dart';
import 'package:flutter_app/Core/AuthControllerCore.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:flutter_app/Services/AuthService.dart';
import 'package:get/get.dart';

class LoginController extends AuthControllerCore {

  final AuthService _authService = Get.find<AuthService>() ;
  final ApiService _apiService = Get.find<ApiService>() ;

  var loading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  void updateEmail( String? value ) => email.value = value ?? '' ;

  void updatePassword( String? value ) => password.value = value ?? '' ;

  bool validateEmail() => email.value.isNotEmpty ;

  bool validatePassword() => email.value.isNotEmpty ;

  Future<bool> login( BuildContext context ) async {

    if( ! validateEmail() || ! validatePassword() )
    {
      warningToast( context: context ,title: "Error" ,message: "Please enter valid email and password!" ) ;
      return false ;
    }

    loading.value = true ;

    var res =  await _apiService.post( url: "/api/user/login" ,payload: { 'email' : email.value ,'password' : password.value } );

    if( res.runtimeType == BadResponse )
    {
      res as BadResponse ;
      dangerToast( context: context ,title: "Error" ,message:  res.error ) ;
      password.value = '';
      loading.value = false ;
      return false ;
    }
    else
    {
      res as GoodResponse ;
      String token = res.data['data']['token']  ;
      String firstName = res.data['data']['fname']  ;
      String lastName = res.data['data']['lname']  ;
      String phone = res.data['data']['phone']  ;
      await _apiService.updateAuthToken( token ) ;
      await _authService.login(email.value, token, phone, firstName, lastName) ;
      successToast( context: context ,title: "Success" ,message: "Authorized successfully" ) ;
      loading.value = false ;
      return true ;
    }
  }

}