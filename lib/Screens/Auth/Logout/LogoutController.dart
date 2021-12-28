import 'package:flutter_app/Core/AuthControllerCore.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:flutter_app/Services/AuthService.dart';
import 'package:get/get.dart';

class LogoutController extends AuthControllerCore {

  final AuthService _authService = Get.find<AuthService>() ;
  final ApiService _apiService = Get.find<ApiService>() ;

  @override
  void onInit() {
    logout() ;
    super.onInit();
  }

  void logout() async {
    await _authService.logout( service: _apiService ) ;
  }
}