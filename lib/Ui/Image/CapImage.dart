import 'package:flutter/material.dart';

class CapImage extends StatelessWidget {

  String url ;
  String loadingImage = "assets/images/loading.png" ;

  CapImage({ required this.url  }) ;

  CapImage.customLoading({ required this.url , required this.loadingImage }) ;

  @override
  Widget build(BuildContext context) => FadeInImage.assetNetwork(
    fit: BoxFit.cover,
    image: url ,
    placeholder: loadingImage ,
  ) ;

}