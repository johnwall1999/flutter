import 'package:flutter_app/Screens/Auth/Logout/LogoutController.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global/ValidationMixin.dart';

class LogoutScreen extends GetView<LogoutController> with ValidationMixin
{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SizedBox.expand(
          child: SafeArea(
            child:  Container(
              color: CapTheme.white ,
              child: Center(
                child: loading(),
              ),
            ),
          ),
        )
    ) ;
  }

  Widget loading() {
    return const CircularProgressIndicator(
      strokeWidth: 2,
      color: CapTheme.primaryRed,
    );
  }

}