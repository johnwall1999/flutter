// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:flutter_app/Layouts/AuthLayout.dart';
import 'package:flutter_app/Screens/AccountOverview/News/NewsBinding.dart';
import 'package:flutter_app/Screens/AccountOverview/News/NewsScreen.dart';
import 'package:flutter_app/Screens/Auth/ForgotPassword/ForgotPasswordBinding.dart';
import 'package:flutter_app/Screens/Auth/ForgotPassword/ForgotPasswordScreen.dart';
import 'package:flutter_app/Screens/Auth/Login/LoginScreen.dart';
import 'package:flutter_app/Screens/Auth/Login/LoginBinding.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/DashboardScreen.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/DashboardBinding.dart';
import 'package:flutter_app/Screens/Auth/Logout/LogoutBinding.dart';
import 'package:flutter_app/Screens/Auth/Logout/LogoutScreen.dart';
import 'package:flutter_app/Screens/Auth/Register/RegisterBinding.dart';
import 'package:flutter_app/Screens/Auth/Register/RegisterScreen.dart';
import 'package:flutter_app/Screens/Trader/TraderBinding.dart';
import 'package:flutter_app/Screens/Trader/TraderScreen.dart';
import 'package:get/get.dart';

abstract class Routes {

  // Auth
  static const LOGIN = "/login";
  static const LOGOUT = "/logout";
  static const REGISTER = "/register";
  static const FORGOT_PASSWORD = "/forgot-password";

  // Account overview
  static const DASHBOARD = "/dashboard";
  static const NEWS = "/news";
  static const TRADER = "/trader";

  static final PAGES = [
    GetPage(
      name: LOGIN,
      page: () => LoginScreen() ,
      binding: LoginBinding(),
    ),
    GetPage(
      name: REGISTER,
      page: () => RegisterScreen() ,
      binding: RegisterBinding(),
    ),
    GetPage(
      name: FORGOT_PASSWORD,
      page: () => ForgotPasswordScreen() ,
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: LOGOUT,
      page: () => LogoutScreen(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: NEWS,
      page: () => NewsScreen(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: TRADER,
      page: () => TraderScreen(),
      binding: TraderBinding(),
    ),
  ];

}
