import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Core/AuthControllerCore.dart';
import 'package:flutter_app/Global/ValidationMixin.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:get/get.dart';

class RegisterController extends AuthControllerCore with ValidationMixin  {

  final ApiService _apiService = Get.find<ApiService>() ;

  var firstName = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var password = "".obs;
  var loading = false.obs;

  void updateFirstName( String? value ) => firstName.value = value ?? '' ;

  void updateLastName( String? value ) => lastName.value = value ?? '' ;

  void updateEmail( String? value ) => email.value = value ?? '' ;

  void updatePassword( String? value ) => password.value = value ?? '' ;

  Future<bool> register( BuildContext context ) async {

    loading.value = true ;

    var res =  await _apiService.post( url: "/api/user/register" ,payload: { 'fname' : firstName.value ,'lname' : lastName.value , 'email' : email.value ,'password' : password.value } );

    if( res.runtimeType == BadResponse )
    {
      res as BadResponse ;
      dangerToast( context: context ,title: "Error" ,message:  res.error ) ;
      loading.value = false ;
      return false ;
    }
    else
    {
      res as GoodResponse ;
      successToast( context: context ,title: "Success" ,message: "Please check your email for the activation link" ) ;
      loading.value = false ;
      Get.offAndToNamed( Routes.LOGIN ) ;
      return true ;
    }
  }

}