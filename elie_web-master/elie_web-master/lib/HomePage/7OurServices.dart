import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';
import 'IconWidget.dart';

class HomeOurServices extends StatefulWidget {
  @override
  State<HomeOurServices> createState() => _HomeOurServicesState();
}

class _HomeOurServicesState extends State<HomeOurServices> {
  var layerLink = LayerLink();
  var focusNodeSpa = FocusNode();
  var focusNodeSalon = FocusNode();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 2.8,
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: isMobile(screenSize) ? 5 : 180),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: highLcolor,
                          height: 36,
                          thickness: 0.3,
                        )),
                  ),
                  Text(
                    'How do you want to${isMobile(screenSize) ? '\n' : ' '}focus on wellness today?'
                        .toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        letterSpacing: 3,
                        fontSize: 13,
                        fontFamily: 'HD'),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: highLcolor,
                          height: 36,
                          thickness: 0.3,
                        )),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              if (isMobile(screenSize))
                Expanded(
                  child: Stack(
                    children: [
                      CompositedTransformTarget(
                        link: layerLink,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconWidget(
                                  focusNode: focusNodeSalon,
                                  items: [
                                    'At Salon',
                                    'At Home',
                                  ],
                                  iconPath: "assets/saloni.png",
                                  link: layerLink,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'SALON',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontFamily: 'NT'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    getItCart.setSpa(false);
                                    context.router
                                        .pushNamed('/LocationChoicePage');
                                  },
                                  child: Text(
                                    'Explore More',
                                    style: TextStyle(
                                        color: highLcolorLight,
                                        fontSize: 15,
                                        fontFamily: 'NT'),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconWidget(
                                  focusNode: focusNodeSpa,
                                  items: [
                                    'At Spa',
                                    'At Home',
                                  ],
                                  iconPath: "assets/spai.png",
                                  link: layerLink,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'SPA',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontFamily: 'NT'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    getItCart.setSpa(true);

                                    context.router.pushNamed('/LocationPage');
                                  },
                                  child: Text(
                                    'Explore More',
                                    style: TextStyle(
                                        color: highLcolorLight,
                                        fontSize: 15,
                                        fontFamily: 'NT'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              else
                CompositedTransformTarget(
                  link: layerLink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconWidget(
                            focusNode: focusNodeSalon,
                            items: [
                              'At Salon',
                              'At Home',
                            ],
                            iconPath: "assets/saloni.png",
                            link: layerLink,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'SALON',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: 'NT'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              getItCart.setSpa(false);

                              context.router.pushNamed('/LocationChoicePage');
                            },
                            child: Text(
                              'Explore More',
                              style: TextStyle(
                                  color: highLcolorLight,
                                  fontSize: 15,
                                  fontFamily: 'NT'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconWidget(
                            focusNode: focusNodeSpa,
                            items: [
                              'At Spa',
                              'At Home',
                            ],
                            iconPath: "assets/spai.png",
                            link: layerLink,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'SPA',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: 'NT'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              getItCart.setSpa(true);

                              context.router.pushNamed('/LocationChoicePage');
                            },
                            child: Text(
                              'Explore More',
                              style: TextStyle(
                                  color: highLcolorLight,
                                  fontSize: 15,
                                  fontFamily: 'NT'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
