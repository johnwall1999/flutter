import 'package:flutter_app/Ui/Chart/CapLineChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SummaryModel {

  int demoOptionOrders ;
  int demoForexOrders ;
  double demoOptionProfit ;
  double demoForexProfit ;
  List<TimeSeriesData> demoChartData ;
  int realOptionOrders ;
  int realForexOrders ;
  double realOptionProfit ;
  double realForexProfit ;
  List<TimeSeriesData> realChartData ;

  List<charts.Series<TimeSeriesData, DateTime>> get realChartSeries => createChartData( realChartData ) ;
  List<charts.Series<TimeSeriesData, DateTime>> get demoChartSeries => createChartData( demoChartData ) ;

  bool loading = false  ;

  SummaryModel({
    required this.demoOptionOrders,
    required this.demoForexOrders,
    required this.demoOptionProfit,
    required this.demoForexProfit,
    required this.demoChartData ,
    required this.realOptionOrders,
    required this.realForexOrders,
    required this.realOptionProfit,
    required this.realForexProfit,
    required this.realChartData ,
  }) ;

  SummaryModel.loading({
    this.demoOptionOrders = 0,
    this.demoForexOrders = 0,
    this.demoOptionProfit = 0,
    this.demoForexProfit = 0,
    this.demoChartData = const [] ,
    this.realOptionOrders = 0,
    this.realForexOrders = 0,
    this.realOptionProfit = 0,
    this.realForexProfit = 0,
    this.realChartData = const [] ,
  }){
    loading = true ;
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<TimeSeriesData, DateTime>> createChartData( List<TimeSeriesData> data ) {
    return [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'Profit overview',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData item, _) => item.time,
        measureFn: (TimeSeriesData item, _) => item.value,
        data: data ,
      )
    ];
  }

}