import 'package:get/get.dart';
import 'package:flutter_app/Screens/Trader/TraderController.dart';

class TraderBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put<TraderController>(TraderController(), permanent: false );
    // permanent false because we want to destroy controller and if trader id changed doesnt show previous trader detail
  }
}
