import 'package:flutter/material.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/TraderModel.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:get/get.dart';

// To support map index
extension FicListExtension<T> on List<T> {

  /// Maps each element of the list.
  /// The [map] function gets both the original [item] and its [index].
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}

class TradersMixin {

  Widget tradersCard( BuildContext context ,List<TraderModel> traders ) => CapCard(
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
                  "Trading Accounts List" ,
                  style: CapTheme.titleTextStyle,
                  textAlign: TextAlign.left ,
                )
              ),
            )
          ),

          traders.isEmpty ? CapFullWidth(
              child: Padding(
                padding: const EdgeInsets.only( top : 20 ,bottom: 30.0 ),
                child: Image.asset("assets/images/no-account.png"),
              )
          ) :
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 40,
              headingRowHeight: 50,
              dataRowHeight: 60,
              headingRowColor: MaterialStateColor.resolveWith((states) => CapTheme.silver ) ,
              dividerThickness: 0 ,
              showBottomBorder: false ,
              columns: [
                th("Number"),
                th("Type"),
                th("Status"),
                th("Bonus"),
                th("Action"),
              ],
              rows: traders.mapIndexed( ( index ,item ) => trader( item ) ).toList(),
            )
        ) ,
        ]
      )
  );

  DataRow trader( TraderModel trader ) => DataRow(
      cells: [

        // Id
        DataCell(
          td( "# " + trader.accountNumber.toString() )
        ) ,

        // Type
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: [
              Text(
                trader.traderPlan.name.toString() ,
                style: const TextStyle(
                  fontSize : 13 ,
                  color: CapTheme.dark ,
                )
              ) ,
              CapFullWidth(
                height: 2,
                child: Container()
              ),
              Text(
                trader.traderPlan.type.toString() ,
                style:  const TextStyle(
                    fontSize : 12 ,
                    color: CapTheme.secondary
                )
              ) ,
            ],
          )
        ) ,

        // State
        DataCell(
          Text(
            trader.stateText.toString() ,
            style: TextStyle(
              fontSize : 12 ,
              color: CapTheme.convertStringColor( trader.stateColor )
            ) ,
          )
        ) ,

        // Bonus
        DataCell(
          Icon(
            trader.traderPermission.bonus ? Icons.check : Icons.close  ,
            size: 18 ,
            color: CapTheme.convertBoolToColor( trader.traderPermission.bonus ) ,
          ) ,
        ) ,

        // Action
        DataCell(
          GestureDetector(
            child: const Icon( Icons.assignment_outlined ,color: CapTheme.secondary ) ,
            onTap: () => Get.toNamed( Routes.TRADER ,arguments: { 'id' : trader.id } )  ,
          )
        ) ,
      ]
  ) ;

  DataColumn th( String text ) => DataColumn(
      label: Text( text ,textAlign: TextAlign.center ,style: const TextStyle(
          color: CapTheme.secondary ,
          fontSize: 13
      ) )
  ) ;

  Widget td( String text ) => Text( text ,style: const TextStyle(
      color: CapTheme.dark ,
      fontSize: 13
  ) );

}
