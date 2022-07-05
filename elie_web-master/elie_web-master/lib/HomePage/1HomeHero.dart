import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Constants.dart';

class HomeHero extends StatelessWidget {
  HomeHero({Key? key}) : super(key: key);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
        key: GlobalKey(),
        height: isMobile(screenSize) ? screenSize.height / 4 : screenSize.height / 1.5,
        width: screenSize.width,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(milliseconds: 9000),
                pageSnapping: true,
              ),
              items: [
                'assets/carousel/homeC (1).jpg',
                'assets/carousel/homeC (2).jpg',
                'assets/carousel/homeC (3).jpg',
                'assets/carousel/homeC (4).jpg',
              ]
                  .map((item) => Container(
                        child: SizedBox(
                            width: screenSize.width,
                            child: Stack(children: [
                              Positioned.fill(child: Image.asset(item, fit: BoxFit.fill)),

                              // Positioned(
                              //   bottom: 10,
                              //   left: 10,
                              //   child: Row(
                              //     children: [
                              //       OutlinedButton(
                              //         style: OutlinedButton.styleFrom(
                              //           backgroundColor: Color(0xff141414),
                              //           side: BorderSide(
                              //             color: highLcolor,
                              //             width: 1,
                              //           ),
                              //           primary: highLcolor,
                              //         ),
                              //         child: Padding(
                              //           padding: EdgeInsets.symmetric(horizontal: isMobile(screenSize) ? 8 : 40, vertical: 15),
                              //           child: Text(
                              //             'AT  HOME',
                              //             style: TextStyle(
                              //                 color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'NT'),
                              //           ),
                              //         ),
                              //         onPressed: () {
                              //           getItPages.setCurrentPathANDTopColorOFF(ServicesPage.id);
                              //           context.router.pushNamed('/LocationPage');
                              //         },
                              //       ),
                              //       SizedBox(width: 40),
                              //       OutlinedButton(
                              //         style: OutlinedButton.styleFrom(
                              //           backgroundColor: Color(0xff141414),
                              //           side: BorderSide(
                              //             color: highLcolor,
                              //             width: 1,
                              //           ),
                              //           primary: highLcolor,
                              //         ),
                              //         child: Padding(
                              //           padding: EdgeInsets.symmetric(horizontal: isMobile(screenSize) ? 8 : 40, vertical: 15),
                              //           child: Text(
                              //             'AT  SALON',
                              //             style: TextStyle(
                              //                 color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'NT'),
                              //           ),
                              //         ),
                              //         onPressed: () {
                              //           getItPages.setCurrentPathANDTopColorOFF(ServicesPage.id);
                              //           context.router.pushNamed('/LocationPage');
                              //         },
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ])),
                      ))
                  .toList(),
            ),
            Positioned(
                bottom: 10,
                child: isMobile(screenSize)
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => _controller.previousPage(),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: highLcolorDark,
                                size: 40,
                              ),
                            ),
                          ),
                          SizedBox(width: 550),
                          GestureDetector(
                            onTap: () => _controller.nextPage(),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: highLcolorDark,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ))
          ],
        ));
  }
}
