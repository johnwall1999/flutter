import 'package:flutter_app/Config/Env.dart';
import 'package:flutter_app/Core/ControllerCore.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:flutter_app/Services/AuthService.dart';
import 'package:get/get.dart';

abstract class AuthControllerCore extends ControllerCore
{
  final AuthService _authService = Get.find<AuthService>() ;
  final ApiService _apiService = Get.find<ApiService>() ;

  @override
  void onInit() {
    if( Env.validateAuthentication )
    {
      _authService.autoLogin( _apiService ) ;
    }
    super.onInit();
  }
}
