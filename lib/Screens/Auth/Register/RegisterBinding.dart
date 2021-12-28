import 'package:flutter_app/Screens/Auth/Register/RegisterController.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController(), permanent: false);
  }
}
