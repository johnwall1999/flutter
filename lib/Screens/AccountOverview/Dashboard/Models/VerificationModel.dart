import 'package:flutter_app/Ui/Chart/CapPieChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VerificationModel {

  bool identityIsVerified ;
  bool addressIsVerified ;
  bool phoneIsVerified ;
  int verificationPercent ;

  bool loading = false  ;
  List<charts.Series<GaugeSegmentData, String>> get chartSeries => createChartData( verificationPercent ) ;

  VerificationModel({
    required this.identityIsVerified,
    required this.addressIsVerified,
    required this.phoneIsVerified,
    required this.verificationPercent,
  }) ;

  VerificationModel.loading({
    this.identityIsVerified = false ,
    this.addressIsVerified = false,
    this.phoneIsVerified = false,
    this.verificationPercent = 0,
  }) : loading = true ;

  List<charts.Series<GaugeSegmentData, String>> createChartData( int verificationPercent ) {

    List<GaugeSegmentData> data = [] ;

    data.add( GaugeSegmentData('verified', verificationPercent) ) ;
    data.add( GaugeSegmentData('pending', 100 - verificationPercent) ) ;

    return [
      charts.Series<GaugeSegmentData, String>(
        id: 'Segments',
        domainFn: (GaugeSegmentData segment, _) => segment.segment,
        measureFn: (GaugeSegmentData segment, _) => segment.size,
        data: data ,
      )
    ];
  }

}