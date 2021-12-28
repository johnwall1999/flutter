import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class ToastMixin {

  // Config
  final _toastDuration = const Duration( seconds: 5 ) ;
  final _toastMargin = const EdgeInsets.symmetric( horizontal: 10.0 ,vertical: 10.0 ) ;
  final _toastBorderRadius = BorderRadius.circular(10.0) ;
  final _toastPosition = FlashPosition.top ;
  final _toastBackgroundColor = CapTheme.white ;
  final _toastHorizontalDismissDirection = HorizontalDismissDirection.endToStart ;

  // Icons
  final _successIcon = const Icon( Icons.check_circle_rounded ,color : CapTheme.success ,size: 30.0 ) ;
  final _warningIcon = const Icon( Icons.report_rounded ,color : CapTheme.warning ,size: 30.0 ) ;
  final _infoIcon = const Icon( Icons.info ,color : CapTheme.primary ,size: 30.0 ) ;
  final _dangerIcon = const Icon( Icons.report_rounded ,color : CapTheme.danger ,size: 30.0 ) ;

  void _toast({ required BuildContext context,required Widget icon , required String title, required String message }) {
    showFlash(
        context: context,
        duration: _toastDuration,
        builder: ( context ,controller ) {
          return SafeArea(child: Flash.bar(
            controller: controller ,
            margin: _toastMargin ,
            borderRadius: _toastBorderRadius,
            backgroundColor: _toastBackgroundColor,
            position: _toastPosition,
            enableVerticalDrag: true ,
            horizontalDismissDirection: _toastHorizontalDismissDirection,
            child: FlashBar(
              title: Text(
                title ,
                style: Theme.of(context).textTheme.headline6,
              ) ,
              content: Text( message ) ,
              icon : icon  ,
              shouldIconPulse: false ,
            ) ,
          )
          );
      });
  }
  void successToast({ required BuildContext context , required String title, required String message }) => _toast(context: context, icon: _successIcon, title: title, message: message ) ;
  void warningToast({ required BuildContext context , required String title, required String message }) => _toast(context: context, icon: _warningIcon, title: title, message: message ) ;
  void infoToast({ required BuildContext context , required String title, required String message }) => _toast(context: context, icon: _infoIcon, title: title, message: message ) ;
  void dangerToast({ required BuildContext context , required String title, required String message }) => _toast(context: context, icon: _dangerIcon, title: title, message: message ) ;

}