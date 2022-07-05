import 'dart:ui';

import 'package:elie_admin/Screen/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Database/Locator.dart';
import 'Screen/HomePage/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
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
    home: LoginPage(),
    builder: EasyLoading.init(),
  ));
}
