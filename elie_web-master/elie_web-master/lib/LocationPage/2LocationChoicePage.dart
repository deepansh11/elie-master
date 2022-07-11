import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/LocationPage/1LocationCard.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';

class LocationChoicePage extends StatelessWidget {
  LocationChoicePage({Key? key}) : super(key: key);
  static String id = '/Location';

  final List<Widget> locationCards = [
    LocationCard(
      name: 'At ${getItCart.isSpa ? 'Spa' : 'Salon'}',
      img: "assets/l1.png",
      decs: "Choose from our locations",
      lat: 18.552238,
      long: 73.8881713,
      pin: 00,
    ),
    LocationCard(
      name: 'Home',
      img: "assets/athome.jpg",
      decs: "At Your Doorstep",
      atHome: true,
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
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: isMobile(screenSize)
                            ? ListView(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: locationCards,
                              )
                            : GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: 1.3,
                                mainAxisSpacing: 70.0,
                                crossAxisSpacing: 20.0,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                crossAxisCount: isMobile(screenSize) ? 1 : 2,
                                children: locationCards,
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
