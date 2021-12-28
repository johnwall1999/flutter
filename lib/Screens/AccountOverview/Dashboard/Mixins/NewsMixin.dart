import 'package:flutter/material.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Screens/AccountOverview/Dashboard/Models/NewsModel.dart';
import 'package:flutter_app/Ui/Button/CapTextButton.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_app/Ui/Image/CapImage.dart';
import 'package:get/get.dart';

class NewsMixin {

  Widget newsCard( BuildContext context ,NewsModel model ,bool loadingLike ,Function toggleLoading ) => CapCard(
      withVerticalMargin: false,
      contentSize: 100 ,
      child : Column(
        children: [

          // Title
          CapFullWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric( vertical: 15.0 ,horizontal: 12.0 ),
              child:  SizedBox(
                child: Text(
                  model.title ,
                  style: CapTheme.titleTextStyle,
                  textAlign: TextAlign.left ,
                )
              ),
            )
          ),

          // Image
          CapFullWidth(
            child: CapImage( url: model.image ) ,
            height: 200.0 ,
          ),

          // Text
          CapFullWidth(
            child: Padding(
              padding: const EdgeInsets.only( top: 12.0 ,left: 12.0 ,right: 12.0 ),
              child: SizedBox(
                child: Text(
                  model.text ,
                  style: CapTheme.normalTextStyle,
                  textAlign: TextAlign.left ,
                ),
              ),
            )
          ),

          // Actions
          CapFullWidth(
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 12.0 ,vertical: 4.0 ),
                child:  Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          CapTextButton(
                            text: Row(
                              children: [
                                const Icon( Icons.favorite ,size: 22 ) ,
                                Padding(
                                  child: Text( model.likesCount.toString() ,style: CapTheme.normalTextStyle ) ,
                                  padding: const EdgeInsets.symmetric( horizontal: 5.0 )
                                )
                              ],
                            ) ,
                            color: loadingLike ? CapTheme.secondary : CapTheme.danger,
                            onPressed: loadingLike ? () {} : () => toggleLoading( context ) ,
                          ),
                          CapTextButton(
                            text: Row(
                              children: [
                                const Icon( Icons.comment_rounded ,size: 22 ) ,
                                Padding(
                                  child: Text( model.commentsCount.toString() ,style: CapTheme.normalTextStyle ) ,
                                  padding: const EdgeInsets.symmetric( horizontal: 5.0 )
                                )
                              ],
                            ) ,
                            color: CapTheme.primary ,
                            onPressed: () => {} ,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end ,
                        children: [
                          CapTextButton( text: const Text("More ..."), onPressed: () => Get.toNamed( Routes.NEWS ) ,color: CapTheme.secondary )
                        ],
                      )
                    ),
                  ],
                ),
              )
          ),

        ],
      )
  );

  Widget popup( NewsModel model ) => Column(
    children: [
      Text( model.text )
    ],
  );

}
