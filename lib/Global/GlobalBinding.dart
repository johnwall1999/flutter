import 'package:get/get.dart';
import 'package:flutter_app/Global/GlobalController.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
  }
}
