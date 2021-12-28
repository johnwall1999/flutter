import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapRow.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapCard extends StatelessWidget {

  Widget child ;
  double radius ;
  bool withVerticalMargin ;
  int contentSize = 80 ;

  CapCard({ required this.child ,this.radius = 12.0 ,this.contentSize = 80 ,this.withVerticalMargin = true  }) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( radius ),
      ),
      elevation: 3 ,
      shadowColor: CapTheme.black ,
      child: CapRow(
        size: contentSize,
        child: Column(
          children: withVerticalMargin ?
          [
            Container( margin: const EdgeInsets.only( bottom: 20.0  ) ),
            child ,
            Container( margin: const EdgeInsets.only( bottom: 20.0 ) ),
          ]
          :
          [
            child
          ]
        ),
      )
    ) ;
  }

}
