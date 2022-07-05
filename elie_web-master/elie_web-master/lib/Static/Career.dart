import 'dart:async';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';

class Career extends StatefulWidget {
  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  var loading = true;

  delayScreen() {
    if (getItOnce.education == true) {
      loading = false;
    }
    Timer(Duration(seconds: 5), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayScreen();
    getItOnce.education = true;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        endDrawer: NavigationDrawerWidget(context),
        body: Center(
          child: Container(
            height: screenSize.height,
            child: ListView(
              children: [
                TopBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'Career',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: highLcolor,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      '"if you are interested in joining our team as a service provider please install and kindly register here."',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontFamily: 'NT'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: TextButton(
                      child: Text(
                        '"Click here."',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'NT', color: highLcolor),
                      ),
                      onPressed: () {
                        // jsWeb.context.callMethod('open', [
                        //   'https://play.google.com/store/apps/details?id=com.elie.expert'
                        // ]);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                isMobile(screenSize) ? Container() : Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
