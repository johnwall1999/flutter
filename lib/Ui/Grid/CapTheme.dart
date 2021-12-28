// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class CapTheme {

  CapTheme(){
    /// TODO
  }

  static const theme = "dark" ;
  static const Color lessDark = Color.fromRGBO(52, 52, 52, 1.0) ;
  static const Color dark = Color.fromRGBO(26, 26, 39 ,1) ;
  static const Color darker = Color.fromRGBO(22, 22, 31, 1.0) ;
  static const Color light = Color.fromRGBO(238, 240, 248, 1) ;
  static const Color silver = Color.fromRGBO(243, 246, 249, 1) ;
  static const Color black = Color.fromRGBO(0, 0, 0, 1) ;
  static const Color white = Color.fromRGBO(255, 255, 255, 1) ;
  static const Color primaryRed = Color.fromRGBO(242, 73, 73, 1) ;
  static const Color primaryGreen = Color.fromRGBO(242, 73, 73, 1) ;
  static const Color red = Color.fromRGBO(255, 0, 0, 1) ;


  static const Color primary = Color.fromRGBO(0, 158, 247, 1) ;
  static const Color success = Color.fromRGBO(80, 205, 137, 1) ;
  static const Color info = Color.fromRGBO(102, 16, 242, 1) ;
  static const Color warning = Color.fromRGBO(255, 199, 0, 1) ;
  static const Color danger = Color.fromRGBO(242, 73, 73, 1) ;
  static const Color secondary = Color.fromRGBO(126, 130, 153, 1) ;

  static const Color primary_light = Color.fromRGBO(225, 240, 255 ,1) ;
  static const Color primary_lighter = Color.fromRGBO(225, 240, 255 ,1) ;
  static const Color info_lighter = Color.fromRGBO(203, 176, 252, 1.0) ;
  static const Color success_lighter = Color.fromRGBO(201, 247, 245, 1) ;
  static const Color success_light = Color.fromRGBO(27, 197, 189, 1) ;
  static const Color success_dark = Color.fromRGBO(133, 200, 192, 1) ;
  static const Color warning_lighter = Color.fromRGBO(255, 244, 222, 1) ;
  static const Color warning_light = Color.fromRGBO(255, 175, 0, 1) ;
  static const Color danger_lighter = Color.fromRGBO(251, 237, 237, 1) ;
  static const Color danger_light = Color.fromRGBO(246, 78, 96, 1) ;
  static const Color danger_dark = Color.fromRGBO(247, 78, 139, 1) ;

  static Color convertStringColor( String colorString ) {
    switch( colorString )
    {
      case 'success' :
        return CapTheme.success ;
      case 'danger' :
        return CapTheme.danger ;
      case 'primary' :
        return CapTheme.primary ;
      case 'warning' :
        return CapTheme.warning ;
      case 'info' :
        return CapTheme.info ;
      case 'muted' :
        return CapTheme.secondary ;
      default :
        return CapTheme.dark ;
    }
  }

  static Color convertStringColorLighter( String colorString ) {
    switch( colorString )
    {
      case 'success' :
        return CapTheme.success_lighter ;
      case 'danger' :
        return CapTheme.danger_lighter  ;
      case 'primary' :
        return CapTheme.primary_lighter  ;
      case 'warning' :
        return CapTheme.warning_lighter  ;
      case 'info' :
        return CapTheme.info_lighter  ;
      case 'muted' :
        return CapTheme.silver  ;
      default :
        return CapTheme.white  ;
    }
  }

  static Color convertBoolToColor( bool variable ) {
    return variable ? CapTheme.success : CapTheme.danger ;
  }

  // ======================== Inputs ======================== //

  static solidInputDecoration( String placeholder ) => InputDecoration(
      hintText: placeholder ,
      contentPadding: const EdgeInsets.symmetric( vertical: 15.0 ,horizontal: 15 ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white ),
        borderRadius: BorderRadius.all( Radius.circular( 10.0 ) ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white ),
        borderRadius: BorderRadius.all( Radius.circular( 10.0 ) ),
      ),
      filled: true,
      fillColor: CapTheme.silver ,
  ) ;

  static textInputStyle() => const TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeight.w500 ,
  ) ;

// ======================== Inputs ======================== //


// ======================== Buttons ======================== //

  static const textButtonStyle = TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeight.w600 ,
  ) ;

// ======================== Buttons ======================== //


// ======================== Text ======================== //

  static const titleTextStyle = TextStyle(
    fontSize: 14.8 ,
    color: CapTheme.dark ,
    fontWeight: FontWeight.w500 ,
  ) ;

  static const normalTextStyle = TextStyle(
    fontSize: 13 ,
    color: CapTheme.lessDark ,
    fontWeight: FontWeight.w400 ,
  ) ;

// ======================== text ======================== //


}