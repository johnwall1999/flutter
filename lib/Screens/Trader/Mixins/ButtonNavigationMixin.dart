import 'package:flutter/material.dart';

class ButtonNavigationMixin {

  BottomNavigationBar bottomNavigationBar( int tab ,ValueChanged<int>? changeTab ) => BottomNavigationBar(
      iconSize: 22 ,
      selectedIconTheme: const IconThemeData( size: 24 ),
      selectedFontSize: 13,
      unselectedFontSize: 13,
      currentIndex: tab ,
      onTap: changeTab ,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.info ),
          label: "Detail",
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.lock ),
          label: "Permissions",
        ),
        BottomNavigationBarItem(
            icon: Icon( Icons.settings ),
            label: "Setting"
        ),
      ]
  );

}