import 'dart:async';

import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              shrinkWrap: true,
              children: [
                TopBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'About Us',
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Dr. Elie\'s world is your expert wellness stop that cares for you. Explore our products that are made with the highest quality ingredients, developed through extensive clinical research, and designed to ensure that maintaining everyday skincare doesn’t take all day. Book a wellness experience that enriches your mood right here!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontFamily: 'NT', letterSpacing: 1, height: 1.4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
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
