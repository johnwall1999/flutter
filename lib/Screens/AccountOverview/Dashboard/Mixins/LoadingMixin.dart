import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_app/Ui/Loading/CapLoadingLogo.dart';

class LoadingMixin {

  Widget loadingCard() => CapCard(
    withVerticalMargin: false ,
      contentSize: 100 ,
      child : SizedBox(
        width: double.infinity,
        height: 350,
        child: CapLoadingLogo() ,
      )
  );

}
