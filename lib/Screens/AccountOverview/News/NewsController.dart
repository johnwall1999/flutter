import 'package:flutter/material.dart';
import 'package:flutter_app/Core/UserControllerCore.dart';
import 'package:flutter_app/Screens/AccountOverview/News/Models/CommentModel.dart';
import 'package:flutter_app/Screens/AccountOverview/News/Models/NewsModel.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:get/get.dart';

class NewsController extends UserControllerCore
{
  final ApiService _apiService = Get.find<ApiService>() ;

  var news = NewsModel.loading().obs ;
  var comments = <CommentModel>[].obs ;
  var comment = "".obs ;
  var loadingNews = true.obs ;
  var loadingComments = true.obs ;
  var loadingStoringComment = false.obs ;

  @override
  void onInit() {
    super.onInit();
    fetchNews() ;
    fetchComments() ;
  }

  void updateComment( String _comment ) {
    comment.value = _comment ;
  }

  void fetchNews() async {
    loadingNews.value = true ;
    var res = await _apiService.getWithDelay("/api/user/latest-news") ;
    if( res.runtimeType == GoodResponse ) {
      res as GoodResponse;
      news.value.title = res.data['data']['title'] ;
      news.value.subTitle = res.data['data']['sub_title'] ;
      news.value.text = res.data['data']['body'] ;
      news.value.image = res.data['data']['image'] ;
      news.value.commentsCount = res.data['data']['comments_count'] ;
      news.value.likesCount = res.data['data']['likes_count'] ;
      loadingNews.value = false ;
    }
    /// TODO : RESTART OR ALERT USER
  }

  void fetchComments() async {
    loadingComments.value = true ;
    var res = await _apiService.getWithDelay("/api/user/latest-news-comments") ;
    if( res.runtimeType == GoodResponse ) {
      res as GoodResponse;
      for( var comment in res.data['data'] )
      {
        comments.add( CommentModel( name: comment['name'] ,message: comment['message'] ,avatar: comment['avatar'] ,datetime: comment['created_at'] ) ) ;
      }
      loadingComments.value = false ;
    }
    /// TODO : RESTART OR ALERT USER
  }

  void submitComment( BuildContext context ,Function hidePopup ) async {
    loadingStoringComment.value = true ;
    var res =  await _apiService.post( url: "/api/user/store-latest-news-comment" ,payload: { 'comment' : comment.value } );
    if( res.runtimeType == GoodResponse )
    {
      res as GoodResponse;
      successToast( context: context ,title: "Success" ,message: "Your comment submitted successfully!" ) ;
      hidePopup();
      fetchComments() ;
    }
    else
    {
      res as BadResponse ;
      dangerToast( context: context ,title: "Error" ,message:  res.error ) ;
    }
    comment.value = "" ;
    loadingStoringComment.value = false ;
  }


}

