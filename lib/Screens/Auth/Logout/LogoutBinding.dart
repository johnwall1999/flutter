import 'package:flutter_app/Screens/Auth/Logout/LogoutController.dart';
import 'package:get/get.dart';

class LogoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LogoutController>(LogoutController(), permanent: false);
  }
}
