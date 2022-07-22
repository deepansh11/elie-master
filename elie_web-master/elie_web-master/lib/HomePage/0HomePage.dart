import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/HomePage/1HomeHero.dart';
import 'package:elie_web/HomePage/2HomeOurStory.dart';
import 'package:elie_web/HomePage/3HomeOurProduct.dart';
import 'package:elie_web/HomePage/5HomeTestimonial.dart';
import 'package:elie_web/HomePage/6HomeCounter.dart';
import 'package:elie_web/HomePage/7OurServices.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:elie_web/Utils/horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

GlobalKey topBar = GlobalKey(debugLabel: 'topbar');

class HomePage extends StatefulWidget {
  static String id = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var countBool = false;

  ScrollController mainScroll = ScrollController();
  var loading = true;
  delayScreen() {
    if (getItOnce.home == true) {
      loading = false;
    }
    Timer(Duration(seconds: 15), () {
      setState(() {
        loading = false;
      });
    });
  }

  var snakeShape = SnakeShape.rectangle;
  var _selectedItemPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayScreen();
    getItOnce.home = true;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: isMobile(screenSize)
        //     ? (loading
        //         ? null
        //         : SnakeNavigationBar.color(
        //             behaviour: SnakeBarBehaviour.floating,
        //             snakeShape: snakeShape,
        //             showSelectedLabels: true,
        //             showUnselectedLabels: true,
        //             backgroundColor: Color(0xff141414),
        //
        //             ///configuration for SnakeNavigationBar.color
        //             snakeViewColor: Colors.black,
        //             selectedItemColor: highLcolorLight,
        //             unselectedItemColor: highLcolorDark,
        //
        //             ///configuration for SnakeNavigationBar.gradient
        //             //snakeViewGradient: selectedGradient,
        //             //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //             //unselectedItemGradient: unselectedGradient,
        //
        //             currentIndex: _selectedItemPosition,
        //             onTap: (index) {
        //               setState(() => _selectedItemPosition = index);
        //               switch (index) {
        //                 case 0:
        //                   context.router.pushNamed('/');
        //                   break;
        //                 case 1:
        //                   context.router.pushNamed('/');
        //                   break;
        //                 case 2:
        //                   context.router.pushNamed('/LocationChoicePage');
        //                   break;
        //                 case 3:
        //                   context.router.pushNamed('/cart');
        //                   break;
        //                 case 4:
        //                   context.router.pushNamed('/');
        //                   break;
        //               }
        //             },
        //             unselectedLabelStyle: TextStyle(fontSize: 10),
        //             selectedLabelStyle: TextStyle(fontSize: 12),
        //             items: [
        //               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //               BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2_outlined), label: 'Bookings'),
        //               BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Book'),
        //               BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        //               BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile')
        //             ],
        //           ))
        //     : null,
        endDrawer: NavigationDrawerWidget(context),
        // floatingActionButton: loading
        //     ? Container()
        //     : Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           FloatingActionButton(
        //             heroTag: "info",
        //             backgroundColor: Color(0xff707070),
        //             child: FaIcon(FontAwesomeIcons.facebook),
        //             onPressed: () {
        //               // js.context.callMethod('open', ['https://www.facebook.com/profile.php?id=100075496311203']);
        //             },
        //           ),
        //           SizedBox(
        //             height: 5,
        //           ),
        //           FloatingActionButton(
        //             heroTag: 'insta',
        //             child: FaIcon(FontAwesomeIcons.instagram),
        //             onPressed: () {
        //               // js.context.callMethod('open', ['https://www.instagram.com/drelie.world/']);
        //             },
        //           ),
        //         ],
        //
        //       ),
        backgroundColor: Colors.black,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome to Elie\'s world ${getItUserIn.userName != null ? getItUserIn.userName : ''}',
                        style: TextStyle(
                            color: highLcolor, fontSize: 55, fontFamily: 'IT'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/b.gif",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: highLcolor,
                              side: BorderSide(color: Colors.transparent)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isMobile(screenSize) ? 8 : 40,
                                vertical: 15),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: highLcolor,
                                  letterSpacing: 1,
                                  fontSize: 35,
                                  fontFamily: 'IT'),
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
          secondChild: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  stops: [
                    0.3,
                    0.6,
                    0.9
                  ],
                  colors: [
                    Color(0x101010).withOpacity(1),
                    Color(0x242424).withOpacity(1),
                    Color(0x000000).withOpacity(1),
                  ]),
            ),
            height: screenSize.height,
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: NotificationListener<ScrollMetricsNotification>(
                    onNotification: scrollUpdate,
                    child: ListView(
                      controller: mainScroll,
                      children: [
                        screenSize.width < 500
                            ? HorizontalListView()
                            : Container(),
                        HomeHero(),
                        SizedBox(height: 20),
                        HomeOurServices(),
                        SizedBox(height: 20),
                        HomeOurProduct(),
                        SizedBox(height: 20),
                        HomeOurStory(),
                        // SizedBox(height: 10),
                        // HomeOurTeam(),
                        Stack(
                          children: [
                            Positioned(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black26.withOpacity(0.4),
                                    BlendMode.srcOver),
                                child: Image.asset(
                                  'assets/parallax.jpg',
                                  fit: isMobile(screenSize)
                                      ? BoxFit.cover
                                      : BoxFit.fitWidth,
                                  width: screenSize.width,
                                  height: isMobile(screenSize)
                                      ? screenSize.height * 2.5
                                      : screenSize.height / 0.5,
                                ),
                              ),
                              top: -.25 * offset,
                            ),
                            HomeTestimonial(),
                          ],
                        ),
                        HomeCounter(),
                        isMobile(screenSize) ? Container() : Footer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          crossFadeState:
              loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }

  var offset = 0.0;
  bool scrollUpdate(ScrollMetricsNotification scrollMetricsNotification) {
    if (scrollMetricsNotification.metrics.axis == Axis.vertical) {
      FocusScope.of(context).unfocus();
    }
    if (scrollMetricsNotification.metrics.pixels < 4000) {
      setState(() {
        offset = scrollMetricsNotification.metrics.pixels;
      });
    }

    if (scrollMetricsNotification.metrics.pixels > 3000 &&
        scrollMetricsNotification.metrics.pixels < 4000) {
      setState(() {
        countBool = true;
      });
    }

    return true;
  }
}
