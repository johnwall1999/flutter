import 'package:flutter/cupertino.dart';

class CapRounded extends StatelessWidget {

  double height ;
  double radiusTopRight ;
  double radiusTopLeft ;
  double radiusBottomRight ;
  double radiusBottomLeft ;
  Widget child ;

  CapRounded({ required this.child ,this.height = 100.0 ,this.radiusTopRight = 10.0 ,this.radiusTopLeft = 10.0 ,this.radiusBottomRight = 10.0 ,this.radiusBottomLeft = 10.0 }) ;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity ,
    height: height ,
    child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular( radiusBottomLeft ) ,bottomRight: Radius.circular( radiusBottomRight ) ,topLeft: Radius.circular( radiusTopLeft ) ,topRight:  Radius.circular( radiusTopRight ) ) ,
        child: child
    ),
  );


}