import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapTextButton extends StatelessWidget {

  Widget text ;
  Color color ;
  VoidCallback? onPressed ;

  CapTextButton({ required this.text ,required this.onPressed , this.color = CapTheme.primary }) ;

  @override
  Widget build(BuildContext context) => TextButton(
    style: TextButton.styleFrom(
      primary: color,
      textStyle: const TextStyle(fontSize: 14),
    ),
    onPressed: onPressed ,
    child: text,
  );



}