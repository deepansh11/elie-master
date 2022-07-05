import 'package:elie_web/Utils/Carousel.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class HomeTestimonial extends StatelessWidget {
  HomeTestimonial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: (isMobile(screenSize))
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  height: screenSize.height / 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                              child: Divider(
                                color: highLcolor,
                                height: 36,
                                thickness: 0.3,
                              )),
                        ),
                        Text(
                          'OUR HAPPY CUSTOMERS',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 4, fontSize: 13, fontFamily: 'HD'),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 40.0),
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
                      Text(
                        ' GOODNESS YET TO BE EXPLORED ',
                        style: TextStyle(
                          color: highLcolor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontFamily: 'HD',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.asset('assets/happycustomers.jpg'),
                            ),
                            Expanded(
                              flex: 4,
                              child: TestimonialCarousel(),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: screenSize.height / 1.5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: <Widget>[
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                                              child: Divider(
                                                color: highLcolor,
                                                height: 36,
                                                thickness: 0.3,
                                              )),
                                        ),
                                        Text(
                                          'OUR HAPPY CUSTOMER',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 4,
                                              fontSize: 13,
                                              fontFamily: 'HD'),
                                        ),
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 10.0, right: 40.0),
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
                                      Text(
                                        ' GOODNESS YET TO BE EXPLORED ',
                                        style: TextStyle(
                                          color: highLcolor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontFamily: 'HD',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TestimonialCarousel(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset('assets/happycustomers.jpg'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
