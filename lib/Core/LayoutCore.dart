import 'package:flutter/material.dart';

abstract class LayoutCore extends StatelessWidget
{
  String title ;
  Widget? content ;
  List<Widget>? listContent ;
  Widget? floatingActionButton ;
  Widget? bottomNavigationBar ;
  FloatingActionButtonLocation? floatingActionButtonLocation ;

  LayoutCore({ required this.title ,this.content ,this.listContent ,this.floatingActionButton ,this.floatingActionButtonLocation ,this.bottomNavigationBar }) ;

  Widget render() ;

  @override
  Widget build(BuildContext context) => render() ;

}