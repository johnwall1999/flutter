import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class LoadingViewMixin {

  Widget loading() => const SizedBox.expand(
    child: Center(
      child: CircularProgressIndicator(
        color: CapTheme.danger ,
        backgroundColor: CapTheme.white ,
        strokeWidth: 2 ,
      ),
    ),
  );

}