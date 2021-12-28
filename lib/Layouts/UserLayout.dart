import 'package:flutter/material.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Core/LayoutCore.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:flutter_app/Services/AuthService.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapRow.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class UserLayout extends LayoutCore {

  UserLayout({
    required String title ,
    required Widget content ,
    Widget? floatingActionButton ,
    Widget? bottomNavigationBar ,
    FloatingActionButtonLocation? floatingActionButtonLocation ,
  }) : super( title: title ,content: content ,floatingActionButton: floatingActionButton ,floatingActionButtonLocation: floatingActionButtonLocation ,bottomNavigationBar: bottomNavigationBar ) ;


  UserLayout.animated({
    required String title ,
    required List<Widget> listContent ,
    Widget? floatingActionButton ,
    Widget? bottomNavigationBar ,
    FloatingActionButtonLocation? floatingActionButtonLocation ,
  }) : super( title: title ,listContent: listContent ,floatingActionButton : floatingActionButton ,bottomNavigationBar : bottomNavigationBar ,floatingActionButtonLocation : floatingActionButtonLocation ,  ) ;

  @override
  Widget render() => Scaffold(
    appBar: appbar ,
    floatingActionButton: floatingActionButton ,
    bottomNavigationBar: bottomNavigationBar ,
    floatingActionButtonLocation: floatingActionButtonLocation,
    drawer: drawer ,
    body: listContent?.isEmpty ?? true ? body : bodyAnimated ,
  ) ;

  AppBar get appbar => AppBar(

    //appBar config
    backgroundColor: CapTheme.dark ,

    // title
    title: Text( title ,style: const TextStyle( fontSize: 18 ,fontWeight: FontWeight.w500 ) ),
    // right buttons
    actions: [
      profilePopup()
    ],

  ) ;

  Widget get body => SizedBox.expand(
    child: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: CapTheme.light,
        child: SingleChildScrollView(
          child: content,
        ),
      ),
    ),
  );

  Widget get bodyAnimated => SizedBox.expand(
    child: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: CapTheme.light,
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) => ScaleAnimation(
                    duration: const Duration(milliseconds: 600),
                    child: FadeInAnimation(child: widget),
                  ),
                  children: listContent ?? []
                )
            ),
          ),
        ),
      ),
    ),
  );


  Widget get drawer => Drawer(
    backgroundColor: CapTheme.dark,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [

        Container(
          color: CapTheme.darker ,
          width: double.infinity ,
          child: const Padding(
            padding: EdgeInsets.only( top: 50.0 ,bottom: 40.0 ,right: 10.0 ,left: 10.0 ) ,
            child: Text(
              "CapitalCore" ,
              style: TextStyle( fontSize: 30.0 ,color: CapTheme.white ),
            )
          ),
        ),

        drawerItem( 'Account overview' ,Icons.dashboard ,Routes.DASHBOARD ) ,
        drawerItem( 'Forex/Binary platform' ,Icons.computer ,'account-overview' ) ,
        drawerItem( 'Trading history' ,Icons.history ,'account-overview' ) ,

        separator(),

        drawerItem( 'Deposit' ,Icons.account_balance_wallet ,'account-overview' ) ,
        drawerItem( 'Withdrawal' ,Icons.account_balance ,'account-overview' ) ,
        drawerItem( 'Transaction history' ,Icons.assignment_outlined ,'account-overview' ) ,

        separator(),

        drawerItem( 'Referrals' ,Icons.book ,'account-overview' ) ,
        drawerItem( 'Support' ,Icons.support ,'account-overview' ) ,

        separator(),

        drawerItem( 'Logout' ,Icons.door_back_door , Routes.LOGOUT  ) ,

      ],
    ),
  );

  Widget drawerItem( String text ,IconData icon ,String route ) => ListTile(
    title: Row(
      children: [
        Icon(
            icon ,
            size: 22 ,
            color: CapTheme.secondary ,
        ) ,
        Padding(
          padding: const EdgeInsets.symmetric( vertical: 3.0 ,horizontal: 10.0 ),
          child: Text(
            text ,
            style: const TextStyle(
              color: CapTheme.white ,
              fontSize: 13
            ),
          ) ,
        ),
      ],
    ),
    onTap: () { Get.offNamed( route ) ; } ,
  );

  Widget separator() => CapRow(
      size: 80,
      child: const Padding(
        padding: EdgeInsets.symmetric( vertical: 10.0 ),
        child: Divider(
          height: 0,
          thickness: 1,
          color: CapTheme.lessDark ,
        ),
      )
  );

  Widget profilePopup() => PopupMenuButton(
    offset: const Offset( 25, 55 ),
    icon: const Icon( Icons.person ) ,
    itemBuilder: (context) => [
      userAvatar(),
      popUpDivider() ,
      popupItem( const Icon( Icons.person ,color: CapTheme.success ,size: 22 ), "My profile", "Identity information and more" ,Routes.DASHBOARD ) ,
      popupItem( const Icon( Icons.lock_outline ,color: CapTheme.danger ,size: 22 ), "Account setting", "Password management and more" ,Routes.DASHBOARD ) ,
      popupItem( const Icon( Icons.history ,color: CapTheme.primary ,size: 22 ), "Account activity", "Account activity and active sessions" ,Routes.DASHBOARD ) ,
      popUpDivider() ,
      popupLogout() ,
    ],
  );

  PopupMenuItem popupItem( Icon icon ,String title ,String description ,String route ) => PopupMenuItem(
    onTap: () { Get.offAndToNamed( route ) ; } ,
    padding: const EdgeInsets.symmetric( vertical: 2 ,horizontal: 5 ) ,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only( right: 5 ),
            child: icon,
          )  ,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only( left: 5 ),
            child: Column(
              children: [
                CapFullWidth(
                    child: Text( title ,style: const TextStyle( fontSize: 12 ,color: CapTheme.dark ), )
                ),
                CapFullWidth(
                    height: 2,
                    child: Container()
                ),
                CapFullWidth(
                    child: Text( description ,style: const TextStyle( fontSize: 10 ,color: CapTheme.secondary ), )
                ),
              ],
            ),
          ) ,
        ),
      ],
    ),
  );

  PopupMenuItem userAvatar() => PopupMenuItem(
      padding: const EdgeInsets.only( top: 6 ,bottom: 10 ,left: 5 ,right: 5 ) ,
      child : Row(
        children: [
          const Expanded(
              flex : 1 ,
              child: Padding(
                padding: EdgeInsets.only( top: 6.0 ,bottom: 6.0 ,right: 10.0 ,left: 4.0  ) ,
                child: Center(
                  child: Image(
                    height: 45,
                    width: 45,
                    image: NetworkImage("https://app.capitalcore.com/assets/images/logo-large.png"),
                  ),
                )
                ,
              )
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  CapFullWidth(
                      child: const Text("john wolf" ,style: TextStyle( fontSize: 13 ,color: CapTheme.dark ),)
                  ),
                  CapFullWidth(
                      height: 5,
                      child: Container()
                  ),
                  CapFullWidth(
                      child: const Text("johnwolf1999@protonmail.com", style: TextStyle( fontSize: 11 ,color: CapTheme.secondary ))
                  ),
                ],
              )
          ),
        ],
      )
  ) ;

  PopupMenuItem popUpDivider() => const PopupMenuItem(
      enabled: false ,
      padding: EdgeInsets.zero ,
      height: 6,
      child : Divider(
        height: 6,
        thickness: 1,
        color: CapTheme.light,
      )
  ) ;

  PopupMenuItem popupLogout() => PopupMenuItem(
    padding: const EdgeInsets.symmetric( horizontal: 10 ) ,
    child : ElevatedButton.icon(
        icon: const Icon( Icons.logout ,color: CapTheme.primary ,size: 14 , ) ,
        label: const Text('Logout' ,style: TextStyle( fontSize: 11 ,fontWeight: FontWeight.bold ,color: CapTheme.primary )),
        onPressed: () => Get.offAndToNamed( Routes.LOGOUT )  ,
        style: ElevatedButton.styleFrom(
            primary: CapTheme.primary_light,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 2 ),
        ),
      ),
  ) ;



}

