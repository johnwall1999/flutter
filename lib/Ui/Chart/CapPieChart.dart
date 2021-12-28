import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CapPieChart extends StatelessWidget {

  final List<charts.Series<dynamic,String>> seriesList;
  final bool animate = true ;
  final Widget label ;

  CapPieChart({ required this.seriesList ,required this.label });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: 300,
            child: charts.PieChart<String>(seriesList,
              animate: animate,
              defaultRenderer: charts.ArcRendererConfig(
                arcWidth: 15,
                startAngle:  pi,
                arcLength:  2 * pi ,
              )
            ),
          ),
          label
        ],
      ),
    );
  }

}

/// Sample time series data type.
class GaugeSegmentData  {
  final String segment;
  final int size;
  GaugeSegmentData(this.segment, this.size);
}
