import 'package:flutter/material.dart';
import 'package:flutter_app/Layouts/UserLayout.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/DashboardController.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Mixins/LoadingMixin.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Mixins/NewsMixin.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Mixins/SummaryMixin.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Mixins/TradersMixin.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Mixins/VerificationMixin.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> with NewsMixin ,LoadingMixin ,SummaryMixin ,VerificationMixin ,TradersMixin {

  @override
  Widget build(BuildContext context)
  {
    return UserLayout.animated(
        title: "Account overview",
        listContent: [

          Obx(
            () => controller.news.value.loading == true
            ? loadingCard()
            : newsCard( context ,controller.news.value ,controller.loadingToggleLatestNewsLike.value ,controller.toggleLatestNewsLike )
          ) ,

          CapFullWidth(child: Container() ,height: 10) ,

          Obx(
            () => controller.summary.value.loading == true
            ? loadingCard()
            : summaryCard( controller.summaryType.value ,controller.changeSummaryToReal ,controller.changeSummaryToDemo ,controller.summary.value )
          ) ,

          CapFullWidth(child: Container() ,height: 10) ,

          Obx(
            () => controller.verification.value.loading == true
            ? loadingCard()
            : verificationCard( controller.verification.value )
          ) ,

          CapFullWidth(child: Container() ,height: 10) ,

          Obx(
            () => controller.loadingTraders.value == true
            ? loadingCard()
            : tradersCard( context ,controller.traders.value )
          ) ,

        ]
    );
  }


}