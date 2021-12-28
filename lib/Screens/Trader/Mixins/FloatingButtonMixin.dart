import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class FloatingButtonMixin {

  FloatingActionButton floatingActionButton( String loginUrl ) => FloatingActionButton(
    child: Icon( Icons.api  ),
    onPressed: () async { await launch( loginUrl );},
    tooltip: "Login to trading platform",
  ) ;

}