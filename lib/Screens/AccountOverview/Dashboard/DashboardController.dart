import 'package:flutter/material.dart';
import 'package:flutter_app/Core/UserControllerCore.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/NewsModel.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/SummaryModel.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/TraderModel.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/TraderPermissionModel.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/TraderPlanModel.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/VerificationModel.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:flutter_app/Ui/Chart/CapLineChart.dart';
import 'package:get/get.dart';

class DashboardController extends UserControllerCore
{
  final ApiService _apiService = Get.find<ApiService>() ;

  var summaryType = "real".obs ;
  var news = NewsModel.loading().obs ;
  var summary = SummaryModel.loading().obs ;
  var verification = VerificationModel.loading().obs ;
  var traders = RxList<TraderModel>([]);
  var loadingTraders = true.obs ;
  var loadingToggleLatestNewsLike = false.obs ;

  void changeSummaryToReal() => summaryType.value = "real" ;

  void changeSummaryToDemo() => summaryType.value = "demo" ;

  @override
  void onInit() {
    super.onInit();
    fetchNews() ;
    fetchSummary() ;
    fetchVerification() ;
    fetchTraders() ;
  }

  void fetchNews() async {
    var res = await _apiService.getWithDelay("/api/user/latest-news") ;
    if( res.runtimeType == GoodResponse ) {
      res as GoodResponse;
      news.value = NewsModel(
        title : res.data['data']['title'] ,
        text : res.data['data']['sub_title'] ,
        image : res.data['data']['image'] ,
        commentsCount : res.data['data']['comments_count'] ,
        likesCount : res.data['data']['likes_count'] ,
      );
    }
    /// TODO : RESTART OR ALERT USER
  }

  void toggleLatestNewsLike( BuildContext context ) async {
    loadingToggleLatestNewsLike.value = true ;
    var res =  await _apiService.post( url: "/api/user/toggle-latest-news-like" );
    if( res.runtimeType == GoodResponse )
    {
      res as GoodResponse;
      news.value.likesCount += res.data['data']['like'] ? 1 : -1  ;
    }
    else
    {
      res as BadResponse ;
      dangerToast( context: context ,title: "Error" ,message:  res.error ) ;
    }
    loadingToggleLatestNewsLike.value = false ;
  }

  // TODO : fetch from api
  void fetchSummary() async {
    var res = await _apiService.getWithDelay("/api/user/get-account-statistics") ;
    if( res.runtimeType == GoodResponse ) {
      res as GoodResponse;

      List<TimeSeriesData> demoChartData = [] ;
      for( var item in res.data['data']['demo_total_profits'].values )
      {
        demoChartData.add( TimeSeriesData( DateTime.fromMicrosecondsSinceEpoch( item['timestamp'] ) ,item['profit'] + .0 )  ) ;
      }

      List<TimeSeriesData> realChartData = [] ;
      for( var item in res.data['data']['demo_total_profits'].values )
      {
        realChartData.add( TimeSeriesData( DateTime.fromMicrosecondsSinceEpoch( item['timestamp'] ) ,item['profit'] + .0 )  ) ;
      }

      summary.value = SummaryModel(
          demoForexOrders: res.data['data']['demo_forex_orders'] ,
          demoForexProfit: res.data['data']['demo_forex_profit'] + .0 ,
          demoOptionOrders: res.data['data']['demo_option_orders'] ,
          demoOptionProfit: res.data['data']['demo_option_profit'] + .0,
          demoChartData: demoChartData  ,
          realForexOrders: res.data['data']['real_forex_orders'] ,
          realForexProfit: res.data['data']['real_forex_profit'] + .0 ,
          realOptionOrders: res.data['data']['real_option_orders'] ,
          realOptionProfit: res.data['data']['real_option_profit'] + .0,
          realChartData: realChartData  ,
      );
    }
  }

  // TODO : fetch from api
  void fetchVerification() async {
    await Future.delayed( const Duration( seconds: 2 ) ) ;
    verification.value = VerificationModel(
      addressIsVerified: true ,
      identityIsVerified: false ,
      phoneIsVerified: false ,
      verificationPercent: 25 ,
    );
  }

  // TODO : fetch from api
  void fetchTraders() async {
    loadingTraders.value = true ;
    await Future.delayed( const Duration( seconds: 2 ) ) ;
    traders.assignAll([
      TraderModel(
          id: 1,
          accountNumber: 1000,
          stateText: "Active",
          stateColor: "success",
          withdrawalAmountSum: 0,
          depositAmountSum: 0,
          createdAt: "2021 Dec 07 17:19:41",
          traderPermission: TraderPermissionModel(
            bonus: false ,
            leverage: 10 ,
            tradePermission: true ,
          ),
          traderPlan: TraderPlanModel(
            id: 1 ,
            name: "Classic" ,
            type: "real",
            color: "success" ,
            svg: "" ,
          )
      ),
      TraderModel(
          id: 2,
          accountNumber: 1001,
          stateText: "Active",
          stateColor: "success",
          withdrawalAmountSum: 20,
          depositAmountSum: 50,
          createdAt: "2021 Dec 15 17:19:41",
          traderPermission: TraderPermissionModel(
            bonus: true ,
            leverage: 1 ,
            tradePermission: true ,
          ),
          traderPlan: TraderPlanModel(
            id: 1 ,
            name: "Classic" ,
            type: "real",
            color: "success" ,
            svg: "" ,
          )
      ),
      TraderModel(
          id: 3,
          accountNumber: 1002,
          stateText: "Terminated",
          stateColor: "danger",
          withdrawalAmountSum: 10,
          depositAmountSum: 500,
          createdAt: "2021 Dec 26 17:19:41",
          traderPermission: TraderPermissionModel(
            bonus: false ,
            leverage: 50 ,
            tradePermission: false ,
          ),
          traderPlan: TraderPlanModel(
            id: 2 ,
            name: "Classic" ,
            type: "demo",
            color: "primary" ,
            svg: "" ,
          )
      ),
      TraderModel(
          id: 4,
          accountNumber: 1003,
          stateText: "Terminated",
          stateColor: "danger",
          withdrawalAmountSum: 10,
          depositAmountSum: 500,
          createdAt: "2021 Dec 26 17:12:41",
          traderPermission: TraderPermissionModel(
            bonus: false ,
            leverage: 20 ,
            tradePermission: false ,
          ),
          traderPlan: TraderPlanModel(
            id: 2 ,
            name: "Classic" ,
            type: "demo",
            color: "primary" ,
            svg: "" ,
          )
      ),
    ]);
    loadingTraders.value = false ;
  }

}

