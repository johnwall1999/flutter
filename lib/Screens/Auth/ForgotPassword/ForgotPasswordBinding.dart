import 'package:flutter_app/Screens/Auth/ForgotPassword/ForgotPasswordController.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController(), permanent: false);
  }
}
