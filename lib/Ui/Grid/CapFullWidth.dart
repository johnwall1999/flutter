import 'package:flutter/material.dart';

class CapFullWidth extends StatelessWidget {

  Key? key ;
  Widget child ;
  double? height ;

  CapFullWidth({required this.child,this.height ,this.key }) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key : key ,
      width: double.infinity,
      height: height,
      child: child
    );
  }

}