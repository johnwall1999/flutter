import 'package:flutter/material.dart';
import 'package:flutter_app/Global/Animations/AnimationWidgets.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/SummaryModel.dart';
import 'package:flutter_app/Ui/Button/CapTextButton.dart';
import 'package:flutter_app/Ui/Chart/CapLineChart.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SummaryMixin {

  Widget summaryCard(
    String type ,
    Function changeSummaryToReal ,
    Function changeSummaryToDemo ,
    SummaryModel model ,
    )
  {
    return AnimationWidgets.fadeAnimation( SizedBox(
        key: ValueKey<String>(type),
        child: CapCard(
            withVerticalMargin: false,
            contentSize: 100 ,
            child : Column(
              children: [

                // Title
                CapFullWidth(
                  child: Padding(
                    padding: const EdgeInsets.symmetric( vertical: 4 ,horizontal: 15.0 ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CapFullWidth(
                              child: Text(
                                "Your $type account statistics" ,
                                style: CapTheme.titleTextStyle,
                                textAlign: TextAlign.left ,
                              )
                          )
                        ) ,
                        Expanded(
                          flex: 1,
                          child: CapTextButton(
                            text : const Align(
                              alignment: Alignment.center ,
                              child: Icon( Icons.compare_arrows ,color: CapTheme.primary ,size: 25, ),
                            ),
                            onPressed: () => type == 'demo' ? changeSummaryToReal() : changeSummaryToDemo() ,
                          )
                        )
                      ],
                    ),
                  )
                ),

                // Overview
                CapFullWidth(
                    child: Padding(
                      padding: const EdgeInsets.only( top: 5 ,bottom: 10 ,left: 12.0 ,right: 12.0 ),
                      child:  Column(
                        children: [
                          Row(
                            children: [
                              _summaryItem(Icons.auto_stories, CapTheme.info, "Options orders", type == 'demo' ? model.demoOptionOrders.toString() : model.realOptionOrders.toString() )  ,
                              _summaryItem(Icons.backpack_rounded, CapTheme.danger, "Forex orders", type == 'demo' ? model.demoForexOrders.toString() : model.realForexOrders.toString() ) ,
                            ],
                          ),
                          CapFullWidth(
                            height: 15 ,
                            child: Container() ,
                          ),
                          Row(
                            children: [
                              _summaryItem(Icons.backup_table_sharp, CapTheme.success, "Options profit", "\$${type == 'demo' ? model.demoOptionProfit.toString() : model.realOptionProfit.toString()}") ,
                              _summaryItem(Icons.balcony_rounded , CapTheme.primary, "Forex profit", "\$${type == 'demo' ? model.demoForexProfit.toString() : model.realForexProfit.toString()}" ) ,
                            ],
                          ),
                        ],
                      ),
                    )
                ),

                // Chart
                type == 'demo' ?
                  _summaryChart( model.demoChartSeries ) :
                  _summaryChart( model.realChartSeries )

              ],
            )
        )
    ) ) ;
  }

  Widget _summaryItem( IconData icon ,Color color , String description ,String value ) => Expanded(
    flex : 1,
    child: CapFullWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 4.0 ,horizontal: 4.0 ),
          child:  Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Icon(
                    icon ,
                    color: color,
                    size: 35,
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CapFullWidth(child: Text( value ,style: const TextStyle( fontSize: 14 ,color: CapTheme.dark ), )),
                      CapFullWidth(child: Text( description ,style: const TextStyle( fontSize: 11 ,color: CapTheme.secondary ) )),
                    ],
                  )
              ),
            ],
          ),
        )
    ),
  );

  Widget _summaryChart( List<charts.Series<TimeSeriesData, DateTime>> chartData ) => SizedBox(
    width: double.infinity,
    height: 300,
    child: Padding(
      padding: const EdgeInsets.symmetric( vertical: 15.0 ,horizontal: 12.0 ),
      child: CapLineChart( seriesList : chartData ),
    ),
  ) ;

  Widget _animation( Widget child ) => AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition(opacity: animation, child: child),
      child: child
  );

}
