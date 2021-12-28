import 'package:flutter/cupertino.dart';

class AnimationWidgets{

  static Widget sizeAnimation( Widget child ,{ int milliseconds = 800 } ) => AnimatedSwitcher(
    duration: Duration( milliseconds: milliseconds ),
    transitionBuilder: (Widget child, Animation<double> animation) => SizeTransition( sizeFactor: Tween( begin: 0.0 ,end: 1.0 ).animate( CurvedAnimation(parent: animation, curve: const Interval( 0.5 ,1.0 )) ),axis: Axis.vertical  ,child: child ),
    child: child
  );

  static Widget fadeAnimation( Widget child ,{ int milliseconds = 800 } ) => AnimatedSwitcher(
    duration: Duration( milliseconds: milliseconds ),
    transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition( opacity: Tween( begin: 0.0 ,end: 1.0 ).animate( CurvedAnimation(parent: animation, curve: const Interval( 0.5 ,1.0 )) ) ,child: child ),
    child: child
  );

}