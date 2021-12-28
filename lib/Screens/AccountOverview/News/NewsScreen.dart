import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Layouts/UserLayout.dart';
import 'package:flutter_app/Screens/AccountOverview/News/Models/CommentModel.dart';
import 'package:flutter_app/Screens/AccountOverview/News/NewsController.dart';
import 'package:flutter_app/Ui/Button/CapButton.dart';
import 'package:flutter_app/Ui/Grid/CapCard.dart';
import 'package:flutter_app/Ui/Grid/CapFullWidth.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';
import 'package:flutter_app/Ui/Image/CapImage.dart';
import 'package:flutter_app/Ui/Loading/CapLoadingLogo.dart';
import 'package:get/get.dart';

class NewsScreen extends GetView<NewsController> {

  @override
  Widget build(BuildContext context)
  {
    return UserLayout.animated(
        floatingActionButton: Obx( () => FloatingActionButton(
          backgroundColor: controller.loadingComments.value ? CapTheme.secondary : CapTheme.primary ,
          child: const Icon( Icons.comment  ),
          onPressed: controller.loadingComments.value ? () => {} : () => _showPopup( context ),
          tooltip: "Add comment",
        )),
        title: "Latest news" ,
        listContent:  [

          // News
          CapCard(
              withVerticalMargin: false ,
              contentSize: 100 ,
              child : ClipRRect(
                borderRadius: BorderRadius.circular( 5 ) ,
                child: Column(
                  children: [

                    // Loading
                    Obx( () =>
                    controller.loadingNews.value ?
                    CapFullWidth(
                      height: 600,
                      child: CapLoadingLogo(),
                    ) : const SizedBox(),
                    ) ,

                    // Image
                    Obx( () =>
                    controller.loadingNews.value ? const SizedBox() : CapFullWidth(
                      height: 300 ,
                      child:  CapImage( url: controller.news.value.image ),
                    ),
                    ) ,

                    // Body
                    Obx( () =>
                    controller.loadingNews.value ? const SizedBox() : CapFullWidth(
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 15 ,horizontal: 15 ),
                        child: Column(
                          children: [
                            CapFullWidth( child: Text( controller.news.value.title ,style:  CapTheme.titleTextStyle )) ,
                            CapFullWidth( height: 12 ,child: Container() ) ,
                            CapFullWidth( child: Text( controller.news.value.subTitle ,style:  CapTheme.normalTextStyle ) ) ,
                            const Divider(
                              height: 30,
                              thickness: 1,
                              color: CapTheme.light ,
                            ),
                            CapFullWidth( child: Text( controller.news.value.text ,style:  CapTheme.normalTextStyle ) ) ,
                          ],
                        ),
                      ),
                    ),
                    ) ,

                  ],
                ),
              )
          ) ,

          // Comments
          CapFullWidth(
              child: Obx( () => controller.loadingComments.value || controller.comments.isEmpty ? Container() : CarouselSlider(
                options: CarouselOptions(
                  height: 250
                ),
                items: controller.comments.map(( CommentModel comment ) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          margin:  const EdgeInsets.symmetric(horizontal: 8.0 ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: [

                              // Avatar
                              CapFullWidth(
                                child: Center(
                                  child: SizedBox(
                                    height: 120 ,
                                    width: 120  ,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: CapImage( url: comment.avatar ),
                                    ),
                                  ),
                                ) ,
                              ) ,
                              CapFullWidth( child: Container() ,height: 7.5 ) ,

                              // Name
                              CapFullWidth( child: Text( comment.name ,style: CapTheme.titleTextStyle ,textAlign: TextAlign.center, ) ) ,
                              CapFullWidth( child: Container() ,height: 7.5 ) ,

                              // Comment
                              CapFullWidth(child: Text( comment.message ,style: CapTheme.normalTextStyle ,textAlign: TextAlign.center, ) ) ,

                            ],
                          )
                      );
                    },
                  );
                }).toList(),
              )
            )
          ) ,

        ]
    );
  }


  Widget popUpStoreComment( BuildContext context ) => CapFullWidth(
      child: AlertDialog(
        content: SizedBox(
          height: 150 ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              CapFullWidth( child: const Text( "Add comment" ,style:  CapTheme.titleTextStyle ) ) ,
              Obx( () => TextFormField(
                style: CapTheme.textInputStyle(),
                initialValue: controller.comment.value ,
                decoration:  CapTheme.solidInputDecoration("Enter your comment ")  ,
                onChanged: controller.updateComment ,
              ) ),
              CapFullWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      Obx( () => CapButton.stateFull(
                        text: 'Submit',
                        rounded: false ,
                        onPressed: () => controller.submitComment( context ,() => _hidePopup(context) ) ,
                        color: CapTheme.primary ,
                        loading: controller.loadingStoringComment.value ,
                      )) ,
                      Obx( () => CapButton.stateFull(
                        text: 'Close',
                        rounded: false ,
                        onPressed: () => _hidePopup(context) ,
                        color: CapTheme.secondary ,
                        loading: controller.loadingStoringComment.value ,
                      )) ,
                    ],
                  )
              )
            ],
          ),
        ),
      )
  ) ;



  void _showPopup( BuildContext context ) {
    showDialog(
        context: context,
        builder: (_) {
          return popUpStoreComment( context ) ;
        }
    );
  }

  void _hidePopup( BuildContext context ) {
    Navigator.pop(context) ;
  }

}