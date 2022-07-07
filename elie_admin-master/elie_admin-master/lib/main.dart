import 'dart:ui';

import 'package:elie_admin/Screen/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Database/Locator.dart';
import 'Screen/HomePage/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  var pageIndex = prefs.getInt('pageIndex');

  print("Pref Value in admin function: $pageIndex");

  runApp(MaterialApp(
    scrollBehavior: MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown
      },
    ),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark()
        .copyWith(scrollbarTheme: ScrollbarThemeData(isAlwaysShown: true)),
    home: isLoggedIn
        ? HomePage(
            initialIndex: pageIndex,
          )
        : LoginPage(),
    builder: EasyLoading.init(),
  ));
}
