import 'package:flutter_app/Screens/Trader/Models/TraderPermissionModel.dart';
import 'package:flutter_app/Screens/Trader/Models/TraderPlanModel.dart';

class TraderModel {

  final int id  ;
  final int accountNumber  ;
  final double balance  ;
  final double credit  ;
  final String stateText ;
  final String stateColor ;
  final String createdAt ;
  final String loginUrl ;
  TraderPermissionModel traderPermission ;
  TraderPlanModel traderPlan ;
  bool loading = false ;

  TraderModel({
    required this.id,
    required this.accountNumber,
    required this.balance,
    required this.credit,
    required this.stateText,
    required this.stateColor,
    required this.createdAt ,
    required this.loginUrl ,
    required this.traderPermission ,
    required this.traderPlan ,
    this.loading = false ,
  }) ;

  factory TraderModel.loading() {
    return TraderModel(
      id : 1,
      accountNumber : 0,
      balance : 0,
      credit : 0,
      stateText : "",
      stateColor : "",
      loginUrl : "",
      createdAt : "",
      traderPermission : TraderPermissionModel.test(),
      traderPlan: TraderPlanModel.test(),
      loading : true
    );
  }

  factory TraderModel.test() {
    return TraderModel(
      id : 1,
      accountNumber : 1000,
      balance : 100,
      credit : 40,
      stateText : "Active",
      stateColor : "success",
      loginUrl : "https://app.capitalcore.com/fxadmin",
      createdAt : "2021 Dec 07 17:19:41",
      traderPermission : TraderPermissionModel.test(),
      traderPlan: TraderPlanModel.test(),
      loading : false
    );
  }

}