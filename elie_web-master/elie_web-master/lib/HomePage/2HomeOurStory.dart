import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class HomeOurStory extends StatelessWidget {
  const HomeOurStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 9),
      child: Container(
          color: Colors.transparent,
          height: screenSize.height / Responsive.responsiveNumber(1.1, 1.1, screenSize),
          child: screenSize.width < 940
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: <Widget>[
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
                          'OUR STORY',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 13, fontFamily: 'NT'),
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
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          ' FOLLOW  YOUR  MOONLIGHT ',
                          style: TextStyle(
                            color: highLcolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontFamily: 'NT',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          '\"When self-care is the most underrated service to oneself, Dr. Elie steps in to fill in for that journey. Understanding the holistic approach and bringing out solutions in accordance is what we aim to achieve at Elie World With the help of professionals bagging years of expertise, you can bring yourself to put in blind faith in exchange of premium care. Attain the luxury your body deserves from the ones that are best of their fields."\ ',
                          style: TextStyle(color: Colors.white, letterSpacing: 1, height: 1.4, fontSize: 14, fontFamily: 'NT'),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Text(
                          "\" Look & feel like the best version of yourself \"",
                          style: TextStyle(
                              color: highLcolor,
                              fontSize: Responsive.responsiveNumber(25.0, 30.0, screenSize),
                              letterSpacing: 2,
                              fontFamily: 'NT'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: Text(
                                'DISCOVER MORE',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1, fontSize: 16, fontFamily: 'NT'),
                              ),
                            ),
                            onPressed: () {
                              context.router.pushNamed("/About");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Since 2017',
                            style: TextStyle(color: highLcolorLight, fontSize: 30, fontFamily: 'NT'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              //   WEB//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              : Row(
                  children: [
                    Flexible(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 20, left: 70, child: SizedBox(height: 640 / 2, width: 960 / 2, child: Image.asset("assets/lady1.png"))),
                          Positioned(
                              top: 120, left: -50, child: SizedBox(height: 821 / 2, width: 548 / 2, child: Image.asset("assets/lady2.png"))),
                          Positioned(
                              top: 350, left: 250, child: SizedBox(height: 367 / 2, width: 437 / 2, child: Image.asset("assets/lady3.png")))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: <Widget>[
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                    child: Divider(
                                      color: highLcolor,
                                      height: 36,
                                      thickness: 0.3,
                                    )),
                              ),
                              Text(
                                'OUR STORY',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 13, fontFamily: 'NT'),
                              ),
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                    child: Divider(
                                      color: highLcolor,
                                      height: 36,
                                      thickness: 0.3,
                                    )),
                              ),
                            ]),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Text(
                                'FOLLOW  YOUR  MOONLIGHT',
                                style: TextStyle(
                                  color: highLcolor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  fontFamily: 'HD',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                '\"When self-care is the most underrated service to oneself, Dr. Elie steps in to fill in for that journey. Understanding the holisticapproach and bringing out solutions in accordance is what we aim to achieve at Elie World With the help of professionals bagging years of expertise, you can bring yourself to put in blind faith in exchange of premium care.Attain the luxury your body deserves from the ones that are best of their fields."\ ',
                                style: TextStyle(color: Colors.white, letterSpacing: 1, height: 1.4, fontSize: 18, fontFamily: 'p1'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                              child: Text(
                                "\" Look & feel like the best version of \n "
                                "yourself \"",
                                style: TextStyle(color: highLcolor, fontSize: 40, letterSpacing: 2, fontFamily: 'IT'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                      child: Text(
                                        'CONTACT US',
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1, fontSize: 16, fontFamily: 'p2'),
                                      ),
                                    ),
                                    onPressed: () {
                                      context.router.pushNamed("/About");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
