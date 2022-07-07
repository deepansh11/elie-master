import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/LocationPage/1LocationCard.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';

class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  static String id = '/Location';

  List<Widget> LocationCards = [
    LocationCard(
      name: 'Ritz Carlton Pune',
      img: "assets/l1.png",
      decs: "The golf course square, Airport Road, Yerwada, Pune (411006)",
      lat: 18.552238,
      long: 73.8881713,
      pin: 1,
    ),
    LocationCard(
      name: 'Panchshil Towers',
      img: "assets/l2.png",
      decs: "Vitthal Nagar, Kharadi, Pune (411014)",
      lat: 18.5520973,
      long: 73.9596132,
      pin: 2,
    ),
    LocationCard(
      name: 'Uno Training School',
      img: "assets/l3.png",
      decs: "Eon Free Zone, Kharadi, Pune (411014)",
      lat: 18.5510832,
      long: 73.946758,
      pin: 3,
    ),
    LocationCard(
      name: 'Uno Salon',
      img: "assets/l4.png",
      decs: "Uno Salon, J.W. Marriot Senapati Bapat Marg Pune",
      lat: 18.5323346,
      long: 73.8273988,
      pin: 4,
    ),
  ];

  List<Widget> LocationCardSpa = [
    LocationCard(
      name: 'Panchshil Towers',
      img: "assets/l2.png",
      decs: "Vitthal Nagar, Kharadi, Pune (411014)",
      lat: 18.5520973,
      long: 73.9596132,
      pin: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Colors.black,
        body: Container(
            height: screenSize.height,
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          "Select Your Location",
                          style: TextStyle(
                            color: highLcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            fontFamily: 'HD',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          "Due to these uncertain times, salon hours may vary. Stylists hours will be updated regularly, so you can schedule with confidence. ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              letterSpacing: 1,
                              fontFamily: 'p2'),
                        ),
                      ),
                      SizedBox(
                        height:
                            Responsive.responsiveNumber(10.0, 30.0, screenSize),
                        width: screenSize.width / 3.0,
                        child: Divider(
                          thickness: 1.0,
                          color: highLcolorLight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: isMobile(screenSize)
                            ? ListView(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: getItCart.isSpa
                                    ? LocationCardSpa
                                    : LocationCards,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  childAspectRatio: 1.3,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  crossAxisCount: isMobile(screenSize) ? 1 : 3,
                                  children: getItCart.isSpa
                                      ? LocationCardSpa
                                      : LocationCards,
                                ),
                              ),
                      ),
                      isMobile(screenSize) ? Container() : Footer()
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
