import 'package:flutter_app/Screens/AccountOverview/News/NewsController.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put<NewsController>(NewsController(), permanent: true );
  }
}
