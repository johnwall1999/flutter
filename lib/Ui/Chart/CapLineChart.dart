import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CapLineChart extends StatelessWidget {

  final List<charts.Series<TimeSeriesData, DateTime>> seriesList;
  final bool animate = true ;

  CapLineChart({ required this.seriesList });

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

}

/// Sample time series data type.
class TimeSeriesData {
  final DateTime time;
  final double value;
  TimeSeriesData(this.time, this.value);
}
