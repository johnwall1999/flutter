import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapTextP extends StatelessWidget {

  String text ;

  CapTextP({ required this.text }) ;

  @override
  Widget build(BuildContext context) => Text(
    text ,
    style: const TextStyle(
        fontWeight: FontWeight.normal ,
        color: CapTheme.dark ,
        fontSize: 14.0
    ),
    textAlign: TextAlign.left ,
  );

}