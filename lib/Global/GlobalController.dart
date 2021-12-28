import 'package:flutter_app/Services/ApiService.dart';
import 'package:flutter_app/Services/AuthService.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {

  final AuthService authService = Get.put( AuthService(), permanent: true) ;
  final ApiService apiService = Get.put( ApiService(), permanent: true) ;

}