import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Trader/Models/TraderModel.dart';
import 'package:flutter_app/Ui/Form/CapSelect.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_app/Ui/Text/CapTextH6.dart';

class TraderMixin {

  Widget details( TraderModel trader ) => CapFullWidth(
    child: Column(
      children: [
        CapFullWidth( child: CapTextH6( text: "Trading account detail" ) ),
        CapFullWidth(child: Container() ,height: 20 ),
        coloredRow(
          firstChild : secondaryText("Account number:"),
          secondChild : darkText( trader.id.toString() ) ,
          dark: true ,
        ),
        coloredRow(
          firstChild : secondaryText("Type:"),
          secondChild : darkText( trader.traderPlan.type.toString() ) ,
        ),
        coloredRow(
          firstChild : secondaryText("Account plan:"),
          secondChild : darkText( trader.traderPlan.name.toString() ) ,
          dark: true ,
        ),
        coloredRow(
          firstChild : secondaryText("Balance:"),
          secondChild : darkText( trader.balance.toString() ) ,
        ),
        coloredRow(
          firstChild : secondaryText("Credit:"),
          secondChild : darkText( trader.credit.toString() ) ,
          dark: true ,
        ),
        coloredRow(
          firstChild : secondaryText("Account status:"),
          secondChild : coloredText( trader.stateText.toString() ,CapTheme.convertStringColor( trader.stateColor ) ) ,
        ),
      ],
    ),
  );

  Widget permissions( TraderModel trader ) => CapFullWidth(
    child: Column(
      children: [
        CapFullWidth( child: CapTextH6( text: "Trading account permissions" ) ),
        CapFullWidth(child: Container() ,height: 20 ),
        coloredRow(
          firstChild : secondaryText("Max Leverage:"),
          secondChild : darkText( trader.traderPermission.maxLeverage.toString() ) ,
          dark: true ,
        ),
        coloredRow(
          firstChild : secondaryText("Bonus:"),
          secondChild : coloredBoolText( trader.traderPermission.bonus ) ,
        ),
        coloredRow(
          firstChild : secondaryText("Max positions:"),
          secondChild : darkText( trader.traderPermission.maxPositions.toString() ) ,
          dark: true ,
        ),
        coloredRow(
          firstChild : secondaryText("Stop out level:"),
          secondChild : darkText( trader.traderPermission.stopOutLevel.toString() ) ,
        ),
        coloredRow(
          firstChild : secondaryText("Max credit:"),
          secondChild : darkText( trader.traderPermission.maxCredit.toString() ) ,
          dark: true ,
        ),
        coloredRow(
          firstChild : secondaryText("Tradable Bonus:"),
          secondChild : coloredBoolText( trader.traderPermission.tradableBonus ) ,
        ),
        CapFullWidth(child: Container() ,height: 5 ),
      ],
    ),
  );

  Widget setting( TraderModel trader ) => CapFullWidth(
    child: Column(
      children: [
        CapFullWidth( child: CapTextH6( text: "Trading account setting" ) ),
        CapFullWidth(child: Container() ,height: 20 ),
        inputRow(
          dark: true,
          firstChild: secondaryText("Email notification"),
          secondChild: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap ,
            value: trader.traderPermission.bonus ,
            onChanged: ( _ ) => true
          )
        ) ,
        inputRow(
          firstChild: secondaryText("Sms notification"),
          secondChild: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap ,
            value: trader.traderPermission.bonus ,
            onChanged: ( _ ) => true
          )
        ) ,
        inputRow(
          dark: true,
          firstChild: secondaryText("Active trading"),
          secondChild: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap ,
            value: trader.traderPermission.bonus ,
            onChanged: ( _ ) => true
          )
        ) ,
        inputRow(
          firstChild: secondaryText("Bonus"),
          secondChild: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap ,
            value: trader.traderPermission.tradePermission ,
            onChanged: ( _ ) => true
          )
        ) ,
        inputRow(
          dark: true,
          firstChild: secondaryText("Leverage"),
          secondChild: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 0 ,vertical: 6.0 ) ,
            child: CapSelect(initialValue: trader.traderPermission.leverage.toString(), items: [ 1,5,10,33,50,100,200,400,500,1000 ].map((leverage) => leverage.toString() ).toList()  ),
          )
        ),
        CapFullWidth(child: Container() ,height: 10 ),
        CapFullWidth(
          height: 42,
          child: Row(
            children: [
              Expanded(
                flex : 1 ,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary : CapTheme.danger ,
                      textStyle: const TextStyle(
                        fontSize: 13 ,
                      ) ,
                    ) ,
                    child: const Text("Terminate"),
                    onPressed: (){} ,
                  ),
                ),
              ),
              Expanded(
                flex : 1 ,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary : CapTheme.primary ,
                      textStyle: const TextStyle(
                        fontSize: 13 ,
                      ) ,
                    ) ,
                    child: const Text("Update"),
                    onPressed: (){} ,
                  ),
                ),
              ),
            ],
          ),
        )
      ]
    )
  );

  Widget inputRow({ required Widget firstChild ,required Widget secondChild  ,bool dark = false }) => coloredRow(firstChild: firstChild, secondChild: secondChild ,dark : dark ,padding: const EdgeInsets.symmetric( vertical : 5.0 ,horizontal: 15 ) ) ;

  Widget coloredRow({ required Widget firstChild ,required Widget secondChild  ,bool dark = false ,EdgeInsets padding = const EdgeInsets.all( 15.0 ) }) => CapFullWidth(
    child: Container(
      padding: padding ,
      decoration: BoxDecoration(
          color : dark ? CapTheme.silver : CapTheme.white ,
          borderRadius: const BorderRadius.all( Radius.circular(5) )
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CapFullWidth( child: firstChild ) ,
          ),
          Expanded(
            flex: 3,
            child: CapFullWidth( child: secondChild ) ,
          ),
        ],
      ),
    ),
  );

  Widget secondaryText( String text ) => Text( text ,style: const TextStyle( fontSize: 13 ,color: CapTheme.secondary ,fontWeight: FontWeight.w400 ) ) ;

  Widget darkText( String text ) => Text( text ,textAlign: TextAlign.center ,style: const TextStyle( fontSize: 13 ,color: CapTheme.dark ,fontWeight: FontWeight.w500 ) ) ;

  Widget coloredText( String text ,Color color ) => Text( text ,textAlign: TextAlign.center ,style: TextStyle( fontSize: 13 ,color: color ,fontWeight: FontWeight.w500 ) ) ;

  Widget coloredBoolText( bool condition ) => Text( condition ? "Yes" : "No" ,textAlign: TextAlign.center ,style: TextStyle( fontSize: 13 ,color: CapTheme.convertBoolToColor( condition ) ,fontWeight: FontWeight.w500 ) ) ;

}