import 'dart:async';

import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';

class EventsPage extends StatefulWidget {
  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  var loading = true;
  delayScreen() {
    if (getItOnce.event == true) {
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
    getItOnce.event = true;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        endDrawer: NavigationDrawerWidget(context),
        body: AnimatedCrossFade(
          duration: Duration(milliseconds: 1000),
          firstChild: SafeArea(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/4.gif",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xff141414),
                            side: BorderSide(
                              color: highLcolor,
                              width: 1,
                            ),
                            primary: highLcolor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: isMobile(screenSize) ? 8 : 40, vertical: 15),
                            child: Text(
                              'Skip...',
                              style:
                                  TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'NT'),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              loading = false;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
          ),
          secondChild: Center(
            child: Container(
              height: screenSize.height,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TopBar(),
                  Center(
                      child: SizedBox(
                    height: Responsive.responsiveNumber(200.0, 500.0, screenSize),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/events.png",
                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'For things that are never an option, there’s always a way out.',
                      style: TextStyle(
                        fontSize: 18,
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
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Table(
                          defaultColumnWidth: FixedColumnWidth(300.0),
                          border: TableBorder.all(color: highLcolor, style: BorderStyle.solid, width: 1),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(children: [Text('Date', style: TextStyle(fontSize: 16.0))]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(children: [Text('Tutorial', style: TextStyle(fontSize: 16.0))]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Saturday 29th January, 2022 7:00 p.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Musical raga by (name of the artist)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Sunday 6th February, 2022 9:00 a.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Zumba madness with (name of the instructor)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Thursday 16th February, 2022 10:00 a.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Exhibiting week-ending traits with (Name of the exhibition)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Saturday 29th January, 2022 7:00 p.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Musical raga by (name of the artist)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Sunday 6th February, 2022 9:00 a.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Zumba madness with (name of the instructor)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Thursday 16th February, 2022 10:00 a.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Exhibiting week-ending traits with (Name of the exhibition)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Saturday 29th January, 2022 7:00 p.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Musical raga by (name of the artist)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Sunday 6th February, 2022 9:00 a.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Zumba madness with (name of the instructor)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Thursday 16th February, 2022 10:00 a.m.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolor,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Exhibiting week-ending traits with (Name of the exhibition)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: highLcolorLight,
                                    letterSpacing: 1,
                                    fontFamily: 'NT',
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  isMobile(screenSize) ? Container() : Footer(),
                ],
              ),
            ),
          ),
          crossFadeState: loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
