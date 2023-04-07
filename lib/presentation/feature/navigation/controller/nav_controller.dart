import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:tostinh/presentation/feature/nav_cart/view/cart_page.dart';
import 'package:tostinh/presentation/feature/nav_chat/view/chat_page.dart';
import 'package:tostinh/presentation/feature/nav_profile/view/profile_page.dart';
import 'package:tostinh/presentation/feature/nav_watch/view/watch_page.dart';

import '../../nav_home/view/home_page.dart';

class NavController extends GetxController {
  int selectedIndex = 0;

  List<Widget> pages = const <Widget>[
    HomePage(),
    WatchPage(),
    ChatPage(),
    CartPage(),
    ProfilePage()
  ];

  void _defaultStatusBar() {
    if (SystemChrome.latestStyle?.statusBarIconBrightness != Brightness.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      );
    }
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    switch (index) {
      case 0:
        _defaultStatusBar();
        break;
      case 1:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        break;
      case 2:
        _defaultStatusBar();
        break;
      case 3:
        _defaultStatusBar();

        break;
      case 4:
        _defaultStatusBar();
        break;
    }
    update();
  }
}
