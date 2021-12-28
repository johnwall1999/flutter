import 'package:flutter_app/Screens/AccountOverview/News/Models/CommentModel.dart';

class NewsModel {

  String title ;
  String subTitle ;
  String image ;
  String text ;
  int commentsCount ;
  int likesCount ;

  bool loading = false  ;

  NewsModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.text,
    required this.commentsCount,
    required this.likesCount ,
  }) ;

  NewsModel.loading({
    this.title = "",
    this.subTitle = "",
    this.image = "",
    this.text = "",
    this.commentsCount = 0,
    this.likesCount = 0 ,
  }){
    loading = true ;
  }


}