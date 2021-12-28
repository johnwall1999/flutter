import 'package:flutter_app/Ui/Chart/CapPieChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VerificationModel {

  bool identityIsVerified ;
  String identityStatusText ;
  String identityStatusColor ;
  bool addressIsVerified ;
  String addressStatusText ;
  String addressStatusColor ;
  bool phoneIsVerified ;
  String phoneStatusText ;
  String phoneStatusColor ;
  int verificationPercent ;

  bool loading = false  ;
  List<charts.Series<GaugeSegmentData, String>> get chartSeries => createChartData( verificationPercent ) ;

  VerificationModel({
    required this.identityIsVerified,
    required this.identityStatusText,
    required this.identityStatusColor,
    required this.addressStatusText,
    required this.addressStatusColor,
    required this.addressIsVerified,
    required this.phoneIsVerified,
    required this.phoneStatusText,
    required this.phoneStatusColor,
    required this.verificationPercent,
  }) ;

  VerificationModel.loading({
    this.identityIsVerified = false ,
    this.identityStatusText = "" ,
    this.identityStatusColor = "" ,
    this.addressIsVerified = false,
    this.addressStatusText = "" ,
    this.addressStatusColor = "" ,
    this.phoneIsVerified = false,
    this.phoneStatusText = "" ,
    this.phoneStatusColor = "" ,
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