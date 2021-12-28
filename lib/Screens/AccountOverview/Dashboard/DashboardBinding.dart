import 'package:get/get.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/DashboardController.dart';

class DashboardBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(), permanent: false );
  }
}
