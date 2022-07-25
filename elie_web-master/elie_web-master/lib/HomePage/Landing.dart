import 'dart:async';

import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/LandingCard.dart';
import 'package:elie_web/Utils/LandingPageTitle.dart';
import 'package:flutter/material.dart';

import '../Database/About.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  static String id = '/';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Future<List<About>?>? about;

  // var loading = true;
  // delayScreen() {
  //   if (getItOnce.home == true) {
  //     loading = false;
  //   }
  //   Timer(Duration(seconds: 15), () {
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    about = getData();
  }

  Future<List<About>?>? getData() async {
    var data = await API().getLanding();

    return data;
  }

  Widget _showOthers(List<About?> data, Device device, Size screenSize) {
    if (device == Device.mobile) {
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 1,
        children: [
          for (About? d in data)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: LandingPageCard(
                data: d,
                shouldReplace: true,
              ),
            ),
        ],
      );
    } else if (device == Device.tablet) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (About? d in data)
                LandingPageCard(
                  data: d,
                  shouldReplace: true,
                ),
            ],
          ));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (About? d in data)
            LandingPageCard(
              data: d,
              shouldReplace: true,
            ),
        ],
      );
    }
  }

  Widget _showWomen(List<About?> data, Device device, Size screenSize) {
    if (device == Device.mobile) {
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 1,
        children: [
          for (About? d in data)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: LandingPageCard(
                data: d,
              ),
            ),
        ],
      );
    } else if (device == Device.tablet) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (About? d in data)
                LandingPageCard(
                  data: d,
                ),
            ],
          ));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (About? d in data)
            LandingPageCard(
              data: d,
            ),
          Image.asset(
            'images/model.png',
            fit: BoxFit.contain,
            height: screenSize.height * 0.95,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: highLcolor, fontFamily: 'NT', fontSize: 35);

    var screenSize = MediaQuery.of(context).size;
    var device = TrueResponsive.screenSize(screenSize);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: about,
            builder: (context, AsyncSnapshot<List<About>?>? snapshot) {
              if (snapshot?.connectionState == ConnectionState.done) {
                List<About>? response = snapshot?.data;

                List<About>? men = [];
                List<About>? women = [];
                List<About>? unisex = [];

                if (response != null) {
                  for (About d in response) {
                    if (d.type == 'W') {
                      women.add(d);
                    }
                    if (d.type == 'M') {
                      men.add(d);
                    }
                    if (d.type == 'U') {
                      unisex.add(d);
                    }
                  }
                }

                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      accentColor: highLcolor,
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: screenSize.height * 1.3,
                            width: screenSize.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/background.png',
                                ),
                                fit: isMobile(screenSize)
                                    ? BoxFit.contain
                                    : BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Responsive.responsiveNumber(
                                    0, 32, screenSize),
                                right: Responsive.responsiveNumber(
                                    0, 32, screenSize),
                                bottom: 32,
                                top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/elie-logo.png',
                                  fit: BoxFit.contain,
                                  height: Responsive.responsiveNumber(
                                    240,
                                    screenSize.height * 0.4,
                                    screenSize,
                                  ),
                                ),
                                Image.asset(
                                  'images/logo.png',
                                  fit: BoxFit.contain,
                                  height: Responsive.responsiveNumber(
                                    180,
                                    screenSize.height * 0.3,
                                    screenSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            left: 5,
                            right: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Feel ',
                                        style: style.copyWith(
                                          color: Colors.white,
                                          fontSize: Responsive.responsiveNumber(
                                            28,
                                            50,
                                            screenSize,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Loved',
                                        style: style.copyWith(
                                          fontFamily: 'QT',
                                          color: Colors.white,
                                          fontSize: Responsive.responsiveNumber(
                                            28,
                                            50,
                                            screenSize,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Responsive.responsiveNumber(
                                      20, 0, screenSize),
                                ),
                                Text(
                                  dataForLanding,
                                  style: style.copyWith(
                                    fontSize: Responsive.responsiveNumber(
                                        12, 14, screenSize),
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    height: 1.4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: Responsive.responsiveNumber(
                                      20, 80, screenSize),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Responsive.responsiveNumber(20, 80, screenSize),
                      ),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Selfcare ',
                                style: style.copyWith(
                                  color: Colors.black,
                                  fontFamily: 'QT',
                                  fontSize: Responsive.responsiveNumber(
                                      28, 70, screenSize),
                                ),
                              ),
                              TextSpan(
                                text: 'Essentials',
                                style: style.copyWith(
                                  color: Colors.black,
                                  fontFamily: 'FT',
                                  fontSize: Responsive.responsiveNumber(
                                      28, 60, screenSize),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          LandingPageTitle(
                            title: 'Women',
                          ),
                          Padding(
                              padding: isMobile(screenSize)
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(left: 80),
                              child: _showWomen(women, device, screenSize)),
                          SizedBox(
                            height: 20,
                          ),
                          LandingPageTitle(title: 'Men'),
                          SizedBox(
                            height:
                                Responsive.responsiveNumber(10, 40, screenSize),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: Responsive.responsiveNumber(
                                      0, 80, screenSize),
                                  right: Responsive.responsiveNumber(
                                      0, 170, screenSize)),
                              child: _showOthers(men, device, screenSize)),
                          SizedBox(
                            height:
                                Responsive.responsiveNumber(20, 40, screenSize),
                          ),
                          LandingPageTitle(title: 'Unisex'),
                          SizedBox(
                            height:
                                Responsive.responsiveNumber(10, 40, screenSize),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Responsive.responsiveNumber(
                                    0, 80, screenSize),
                                right: 0),
                            child: _showOthers(unisex, device, screenSize),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (snapshot?.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: highLcolor,
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
