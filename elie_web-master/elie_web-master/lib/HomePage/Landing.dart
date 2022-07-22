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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

    print(screenSize.width);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Theme(
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
                    height: screenSize.height * 1.6,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/background.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/elie-logo.png',
                          fit: BoxFit.contain,
                          height: Responsive.responsiveNumber(
                              100, screenSize.height * 0.3, screenSize),
                        ),
                        Image.asset(
                          'images/logo.png',
                          fit: BoxFit.contain,
                          height: Responsive.responsiveNumber(
                              100, screenSize.height * 0.2, screenSize),
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
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Feel ',
                                style: style.copyWith(
                                  color: Colors.white,
                                  fontSize: Responsive.responsiveNumber(
                                      28, 50, screenSize),
                                ),
                              ),
                              TextSpan(
                                text: 'Loved',
                                style: style.copyWith(
                                  fontFamily: 'QT',
                                  color: Colors.white,
                                  fontSize: Responsive.responsiveNumber(
                                      20, 50, screenSize),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              Responsive.responsiveNumber(20, 0, screenSize),
                        ),
                        Text(
                          dataForLanding,
                          style: style.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height:
                              Responsive.responsiveNumber(20, 80, screenSize),
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
                          fontSize:
                              Responsive.responsiveNumber(20, 70, screenSize),
                        ),
                      ),
                      TextSpan(
                        text: 'Essentials',
                        style: style.copyWith(
                          color: Colors.black,
                          fontFamily: 'FT',
                          fontSize:
                              Responsive.responsiveNumber(20, 60, screenSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: about,
                builder: (context, AsyncSnapshot<List<About>?>? snapshot) {
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

                  return Column(
                    children: [
                      LandingPageTitle(
                        title: 'Women',
                      ),
                      Padding(
                          padding: isMobile(screenSize)
                              ? EdgeInsets.only(left: 20, right: 10)
                              : EdgeInsets.only(left: 80),
                          child: _showWomen(women, device, screenSize)),
                      SizedBox(
                        height: 20,
                      ),
                      LandingPageTitle(title: 'Men'),
                      SizedBox(
                        height: Responsive.responsiveNumber(10, 40, screenSize),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: Responsive.responsiveNumber(
                                  20, 80, screenSize),
                              right: Responsive.responsiveNumber(
                                  10, 170, screenSize)),
                          child: _showOthers(men, device, screenSize)),
                      SizedBox(
                        height: Responsive.responsiveNumber(20, 40, screenSize),
                      ),
                      LandingPageTitle(title: 'Unisex'),
                      SizedBox(
                        height: Responsive.responsiveNumber(10, 40, screenSize),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                                Responsive.responsiveNumber(20, 80, screenSize),
                            right: 10),
                        child: _showOthers(unisex, device, screenSize),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
