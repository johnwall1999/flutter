import 'package:flutter/cupertino.dart';

class CapRow extends StatelessWidget {

  Widget child ;
  int size = 100 ;

  int get expandSize => ( ( 100 - size ) / 2  ).round() ;

  CapRow({required this.size,required this.child}) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: expandSize,
          child: Container() ,
        ) ,
        Expanded(
            flex: size,
            child: child
        ),
        Expanded(
          flex: expandSize,
          child: Container(),
        ) ,
      ],
    ) ;
  }

}