import 'package:flutter/material.dart';
import 'package:flutter_app/Global/Animations/AnimationWidgets.dart';
import 'package:flutter_app/Global/LoadingViewMixin.dart';
import 'package:flutter_app/Layouts/UserLayout.dart';
import 'package:flutter_app/Screens/Trader/Mixins/ButtonNavigationMixin.dart';
import 'package:flutter_app/Screens/Trader/Mixins/FloatingButtonMixin.dart';
import 'package:flutter_app/Screens/Trader/Mixins/TraderMixin.dart';
import 'package:flutter_app/Screens/Trader/Models/TraderModel.dart';
import 'package:flutter_app/Screens/Trader/TraderController.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:get/get.dart';

class TraderScreen extends GetView<TraderController> with LoadingViewMixin ,ButtonNavigationMixin ,FloatingButtonMixin ,TraderMixin  {

  @override
  Widget build(BuildContext context)
  {
    return UserLayout(
      title: "Trading account #${controller.traderId.toString()}",
      floatingActionButton: Obx( () => floatingActionButton( controller.trader.value.loginUrl ) ),
      bottomNavigationBar: Obx( () => bottomNavigationBar( controller.tab.value, controller.changeTab ) ),
      content: Obx( () => _content() )
    ) ;
  }

  Widget _content() => AnimationWidgets.fadeAnimation(
    SizedBox(
      key: ValueKey<int>(controller.tab.value),
      height: 390,
      child: _tabs( controller.trader.value ).elementAt( controller.tab.value ),
    )
  );

  List<Widget> _tabs( TraderModel trader ) => [
    _card( details( trader ) ),
    _card( permissions( trader ) ),
    _card( setting( trader ) ),
  ];

  Widget _card( Widget child ) => CapCard(
    contentSize: 95 ,
    withVerticalMargin: true ,
    child: controller.trader.value.loading ? SizedBox( child: loading(), height: 300 ,width: double.infinity ) : child
  );

}