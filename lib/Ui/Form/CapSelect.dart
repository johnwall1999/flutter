import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapSelect extends StatelessWidget {

  final String initialValue ;
  final List<String> items ;

  CapSelect({ required this.initialValue ,required this.items }) ;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      alignment: AlignmentDirectional.center ,
      isDense: true,
      value: initialValue ,
      onChanged: ( _ ) => true ,
      isExpanded: true,
      iconSize: 18,
      items: items.map( ( item ) => DropdownMenuItem( value: item.toString() ,child: Text( item.toString() ,style: const TextStyle( fontSize: 14 ,color: CapTheme.dark ) ) ) ).toList() ,
    );
  }

}