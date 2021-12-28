import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapTextH6 extends StatelessWidget {

  String text ;

  CapTextH6({ required this.text }) ;

  @override
  Widget build(BuildContext context) => Text(
    text ,
    style: const TextStyle(
        fontWeight: FontWeight.w500 ,
        color: CapTheme.dark ,
        fontSize: 14.0
    ),
    textAlign: TextAlign.left ,
  );

}