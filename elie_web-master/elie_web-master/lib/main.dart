import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Routes/Routes.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setup();
  setPathUrlStrategy();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  HttpOverrides.global = new MyHttpOverrides();

  if (prefs.get("userPhone") != null && prefs.get("userPhone") != 'null') {
    var user = (await Dio()
            .get('$baseUrl/getCustomerByPhone/${prefs.get("userPhone")}'))
        .data;
    if (user != null) {
      await getItUserIn.setUserIn(prefs.get("userPhone"), prefs.get("userPass"),
          user['name'], user['email']);
    } else {
      getItUserIn.setUserIn(
          prefs.get("userPhone"), prefs.get("userPass"), '', '');
    }
  } else {
    getItUserIn.setUserIn(
        prefs.get("userPhone"), prefs.get("userPass"), '', '');
  }
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  getListForSearchBar() async {
    getItSearchBar.listOfProducts = await API().getProducts();
    getItSearchBar.listOfServices = await API().getServices();
  }

  @override
  void initState() {
    getListForSearchBar();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Elie World',
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: ThemeData.dark().copyWith(
        hoverColor: highLcolor.withOpacity(0.4),
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(highLcolorLight),
          thickness: MaterialStateProperty.all(3),
        ),
        textTheme: Typography.whiteCupertino,
        primaryColor: highLcolor,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
