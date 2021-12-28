import 'package:flutter/material.dart';
import 'package:flutter_app/Core/LayoutCore.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapRow.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AuthLayout extends LayoutCore {

  AuthLayout({ required String title ,required List<Widget> listContent  }) : super( title: title ,listContent: listContent ) ;

  @override
  Widget render() => Scaffold(
    resizeToAvoidBottomInset: false ,
      body: SizedBox.expand(
        child: SafeArea(
          child:  Container(
            color: CapTheme.danger ,
            child: Column(
              children: [
                Container( margin: const EdgeInsets.symmetric( vertical: 10.0) ),
                opacityAnimation(
                    child : logoWidget() ,
                    duration: 1500
                ) ,
                opacityAnimation(
                    child : titleWidget() ,
                    duration: 1600
                ) ,
                Container( margin: const EdgeInsets.symmetric( vertical: 15.0) ),
                Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.only( topRight: Radius.circular(60.0) ,topLeft: Radius.circular(60.0) ) ,
                      ),
                      child: CapFullWidth(
                        child: CapRow(
                          size: 80 ,
                          child: AnimationLimiter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: AnimationConfiguration.toStaggeredList(
                                childAnimationBuilder: (widget) => ScaleAnimation(
                                  duration: const Duration(milliseconds: 500),
                                  child: FadeInAnimation(child: widget),
                                ),
                                children: listContent ?? []
                              )
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          )
          ,
        ),
      )
  ) ;




  Widget logoWidget() {
    return SizedBox(
      height: 135.0,
      child: Image.asset('assets/images/logo.png') ,
    ) ;
  }

  Widget titleWidget() {
    return CapFullWidth(
      child: Column(
        children:  [
          Text( title ,style: const TextStyle( fontSize: 20 ,color: CapTheme.white ,fontWeight: FontWeight.w600 ),) ,
          CapFullWidth( child: Container() ,height: 8 ),
          const Text("Binary & Forex Trading" ,style: TextStyle( fontSize: 14 ,color: CapTheme.white ,fontWeight: FontWeight.w400 )) ,
        ],
      ) ,
    );
  }

  Widget opacityAnimation({ required Widget child ,int duration = 1500 }) {
    return AnimatedOpacity(
        opacity: true ? 1.0 : 0.0,
        duration: Duration( milliseconds: duration ) ,
        child : AnimatedSize(
          duration: Duration( milliseconds: duration ) ,
          child: SizedBox(
            child: child ,
          ) ,
        )
    );
  }
}
