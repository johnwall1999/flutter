import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Trader/Models/TraderModel.dart';
import 'package:get/get.dart';
import 'package:flutter_app/Core/UserControllerCore.dart';

class TraderController extends UserControllerCore
{
 var traderId = 0.obs ;
 var tab = 0.obs ;
 var trader = TraderModel.loading().obs ;

 @override
  void onInit() {
   super.onInit();
   traderId.value = Get.arguments['id'] ;
   fetchTrader () ;
  }

  /// TODO : Sync from api
  fetchTrader() async {
   trader.value.loading = true ;
   await Future.delayed( const Duration( seconds: 3 ) ) ;
   trader.value = TraderModel.test();
   trader.value.loading = false ;
 }

  void changeTab( int index ){
   tab.value = index ;
  }

}

