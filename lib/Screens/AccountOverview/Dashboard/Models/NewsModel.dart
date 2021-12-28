class NewsModel {

  String title ;
  String image ;
  String text ;
  int commentsCount ;
  int likesCount ;

  bool loading = false  ;

  NewsModel({
    required this.title,
    required this.image,
    required this.text,
    required this.commentsCount,
    required this.likesCount ,
  }) ;

  NewsModel.loading({
    this.title = "",
    this.image = "",
    this.text = "",
    this.commentsCount = 0,
    this.likesCount = 0 ,
  }){
    loading = true ;
  }


}