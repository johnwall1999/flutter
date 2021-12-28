import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/TraderPermissionModel.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/TraderPlanModel.dart';

class TraderModel {

  int id  ;
  int accountNumber  ;
  String stateText ;
  String stateColor ;
  int withdrawalAmountSum ;
  int depositAmountSum ;
  String createdAt ;
  TraderPermissionModel traderPermission ;
  TraderPlanModel traderPlan ;

  TraderModel({
    required this.id,
    required this.accountNumber,
    required this.stateText,
    required this.stateColor,
    required this.withdrawalAmountSum ,
    required this.depositAmountSum ,
    required this.createdAt ,
    required this.traderPermission ,
    required this.traderPlan ,
  }) ;

}