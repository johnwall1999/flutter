import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/VerificationModel.dart';
import 'package:flutter_app/Ui/Chart/CapPieChart.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_app/Ui/Text/CapTextH6.dart';

class VerificationMixin {

  Widget verificationCard( VerificationModel model ) => CapCard(
      withVerticalMargin: false,
      contentSize: 100 ,
      child : Column(
        children: [

          // Title
          CapFullWidth(
              child: const Padding(
                padding: EdgeInsets.symmetric( vertical: 15.0 ,horizontal: 12.0 ),
                child: SizedBox(
                  child: Text(
                    "Your Verification Status" ,
                    style: CapTheme.titleTextStyle,
                    textAlign: TextAlign.left ,
                  )
                ),
              )
          ),

          CapPieChart(
            seriesList: model.chartSeries ,
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${model.verificationPercent}%" ,style: const TextStyle( fontSize: 20 ,color: CapTheme.dark )),
                const Text("Progress" ,style: TextStyle( fontSize: 13 ,color: CapTheme.secondary )),
                // CapFullWidth(child: Container() ,height: 35) ,
              ],
            )
          ),

          // Identity
          CapFullWidth(
              child :  verificationStatusRow( Icons.person , model.identityIsVerified , "Identity")
          ),

          CapFullWidth(child: Container() ,height: 10) ,

          // Address
          CapFullWidth(
              child :  verificationStatusRow( Icons.assignment_outlined , model.addressIsVerified , "Address")
          ),

          CapFullWidth(child: Container() ,height: 10) ,

          // Phone
          CapFullWidth(
              child :  verificationStatusRow( Icons.phone_outlined , model.phoneIsVerified , "Phone")
          ),

          CapFullWidth(child: Container() ,height: 15 ) ,

        ],
      )
  );


  Widget verificationStatusRow( IconData icon ,bool valid ,String type ) => Padding(
    padding: const EdgeInsets.symmetric( horizontal: 12.0 ) ,
    child: Container(
      decoration: BoxDecoration(
          color: valid ? CapTheme.success_lighter : CapTheme.warning_lighter ,
          shape: BoxShape.rectangle ,
          borderRadius: BorderRadius.circular( 5.0 )
      ),
      width: double.infinity ,
      child: Column(
        children: [
          CapFullWidth(child: Container() ,height: 10 ) ,
          Row(
            children: [
              Expanded(
                  child: Align(
                    alignment: Alignment.center ,
                    child: Container(
                      width: 38 ,
                      height: 38 ,
                      decoration: BoxDecoration(
                        color: CapTheme.white ,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        icon ,
                        size: 23 ,
                        color : valid ? CapTheme.success_light : CapTheme.warning_light ,
                      ),
                    )
                    ,
                  )
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      CapFullWidth(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "$type verification",
                            style: const TextStyle(
                                color: CapTheme.dark ,
                                fontSize: 12
                            ) ,
                          ),
                        ),
                      ),
                      CapFullWidth(child: Container() ,height: 5 ) ,
                      CapFullWidth(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              valid ? "Verified" : "Pending",
                              style: TextStyle(
                                color: valid ? CapTheme.success_light : CapTheme.warning_light ,
                                fontSize: 10 ,
                              ),
                            ),
                          )
                      ) ,
                    ],
                  )
              ),
            ],
          ) ,
          CapFullWidth(child: Container() ,height: 10 ) ,
        ],
      ),
    ),
  );



}
