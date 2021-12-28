import 'package:flutter/material.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Global/GlobalBinding.dart';
import 'package:get/get.dart';
// import 'package:uni_links/uni_links.dart';

void main() {

  runApp( App() ) ;
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData( fontFamily: 'OpenSans' ),
        builder: (context, child) => Container( child: child ),
        initialBinding : GlobalBinding() ,
        debugShowCheckedModeBanner: false,
        getPages: Routes.PAGES ,
        initialRoute: Routes.DASHBOARD ,
        defaultTransition: Transition.fadeIn,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale(
          'en',
          'EN',
        ),
    ) ;

  }


  // Future<void> initUniLinks() async {
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     final initialLink = await getInitialLink();
  //     // Parse the link and warn the user, if it is not correct,
  //     // but keep in mind it could be `null`.
  //     print( initialLink ) ;
  //   } on PlatformException {
  //     // Handle exception by warning the user their action did not succeed
  //     // return?
  //     print( "Fuck" ) ;
  //   }
  // }

}
