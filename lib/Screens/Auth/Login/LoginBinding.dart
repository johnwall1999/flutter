import 'package:flutter_app/Screens/Auth/Login/LoginController.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: false);
  }
}
