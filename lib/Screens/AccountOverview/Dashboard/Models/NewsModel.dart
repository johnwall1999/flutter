class NewsModel {

  String title ;
  String image ;
  String text ;
  int likesCount ;

  bool loading = false  ;

  NewsModel({
    required this.title,
    required this.image,
    required this.text,
    required this.likesCount ,
  }) ;

  NewsModel.loading({
    this.title = "",
    this.image = "",
    this.text = "",
    this.likesCount = 0 ,
  }){
    loading = true ;
  }


}