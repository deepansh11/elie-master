import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/OverlaySeacrh.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopBar extends StatefulWidget {
  TopBar({
    Key? key,
  }) : super(key: key);
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  var path;
  var currentPage;
  var searchFocus = FocusNode();

  List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  var name;
  late SharedPreferences prefs;

  setSearchtap(tap) {
    searchTaped = tap;
    if (mounted) {
      setState(() {});
    }
  }

  var searchTaped = false;
  var selectedSearch;
  TextEditingController searchBarController = TextEditingController();

  getDropdownList(List s) {
    return s
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: TextStyle(color: Colors.white),
              ),
            ))
        .toList();
  }

  tabDisableColor() {
    for (var count = 0; count < getItPages.onTapTopBar.length; count++) {
      getItPages.onTapTopBar[count] = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  tapColorChange(x, title, {path = "/"}) {
    for (var count = 0; count < getItPages.onTapTopBar.length; count++) {
      getItPages.onTapTopBar[count] = false;
      searchTaped = false;
    }
    if (x == 8) {
      searchTaped = true;
      searchFocus.requestFocus();
    } else {
      context.router.pushNamed(path);
      currentPage.setCurrentPathANDTopColorOFF(path);
      print(currentPage.currentPage);
    }
    if (title == 'SPA') {
      getItCart.setSpa(true);
    } else if (title == 'SALON') {
      getItCart.setSpa(false);
    }
    if (mounted) {
      setState(() {
        getItPages.setonTapTopBar(x, true);
      });
    }
  }

  navLink(x, title, path, {isIcon = false, icon}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          if (mounted) {
            setState(() {
              value ? _isHovering[x] = true : _isHovering[x] = false;
            });
          }
        },
        onTap: () => tapColorChange(x, title, path: path),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                fontFamily: 'NT',
                color: getItPages.onTapTopBar[x]
                    ? highLcolor
                    : !_isHovering[x]
                        ? Colors.white
                        : highLcolor,
              ),
            ),
            if (isIcon)
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    shape: BoxShape.circle,
                    gradient: !_isHovering[x]
                        ? LinearGradient(colors: [
                            Color(0xffFFFFFF).withAlpha(0),
                            Color(0xffFFFFFF).withAlpha(0),
                          ])
                        : LinearGradient(
                            colors: [highLcolorLight, Colors.brown],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                  ),
                  child: Center(
                    child: FaIcon(
                      icon,
                      color: getItPages.onTapTopBar[x]
                          ? highLcolor
                          : _isHovering[x]
                              ? Colors.white
                              : highLcolor,
                      size: 17,
                    ),
                  ))
            else
              Container(),
            SizedBox(height: 5),
            isIcon
                ? Container()
                : Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[x] || getItPages.onTapTopBar[x],
                    child: Container(
                      height: 2,
                      width: 50,
                      color: highLcolorLight,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    currentPage = getIt.get<Pages>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    getItPages.getTapColorChange(tabDisableColor);
    return SafeArea(
      child: Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: [
        if (screenSize.width > 940)
          /////DESKTOP

          PreferredSize(
            preferredSize: Size(screenSize.width, 100),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                    stops: [
                      0.2,
                      0.4,
                      0.6,
                      0.7,
                      0.9
                    ],
                    colors: [
                      Color(0x101010).withOpacity(1),
                      Color(0x333333).withOpacity(1),
                      Color(0x212020).withOpacity(1),
                      Color(0x242424).withOpacity(1),
                      Color(0x000000).withOpacity(1),
                    ]),
                border: Border(
                    bottom: BorderSide(color: highLcolorLight, width: 0.5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if ('/' != currentPage.currentPage) {
                          currentPage.setCurrentPathANDTopColorOFF('/');
                          print(currentPage.currentPage);
                        }
                      },
                      child: Image.asset(
                        'assets/logo.jpg',
                        width: 130,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: screenSize.width / 17),
                          navLink(0, 'HOME', '/'),

                          SizedBox(width: screenSize.width / 30),
                          navLink(1, 'SALON', '/LocationChoicePage'),
                          SizedBox(width: screenSize.width / 30),
                          navLink(2, 'SPA', '/LocationChoicePage'),
                          SizedBox(width: screenSize.width / 30),
                          navLink(11, 'TATTOO', '/Tattoo'),
                          SizedBox(width: screenSize.width / 30),
                          navLink(3, 'PRODUCTS', '/product'),
                          SizedBox(width: screenSize.width / 30),
                          navLink(12, 'CAREER', '/Career'),
                          // SizedBox(width: screenSize.width / 30),
                          // navLink(4, 'EDUCATION', '/Education'),
                          // SizedBox(width: screenSize.width / 30),
                          // navLink(5, 'FITNESS', '/Fitness'),
                          // SizedBox(width: screenSize.width / 30),
                          // navLink(6, 'EVENTS', '/ThankYouPage'),
                        ],
                      ),
                    ),
                    /////////////SEARCHBAR/////////////SEARCHBAR/////////////SEARCHBAR/////////////SEARCHBAR/////////////SEARCHBAR
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    if (searchTaped)
                      SizedBox(
                        width: screenSize.width / 5,
                        child: OverlaySearch(setSearchtap, searchFocus),
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: screenSize.width / 20),
                          getItUserIn.userPhone != null
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    navLink(10, getItUserIn.userName ?? '',
                                        '/OrderPage',
                                        isIcon: false),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    navLink(7, 'LOGIN', '/LoginPage',
                                        isIcon: false),
                                  ],
                                ),
                          SizedBox(width: screenSize.width / 40),
                          navLink(8, '', '',
                              isIcon: true, icon: FontAwesomeIcons.search),
                          SizedBox(width: screenSize.width / 40),
                          getItUserIn.userPhone != null
                              ? navLink(9, '', '/cart',
                                  isIcon: true, icon: FontAwesomeIcons.opencart)
                              : Container(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          )
        else

          ///MOBILE
          PreferredSize(
            preferredSize: Size(screenSize.width, screenSize.height / 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                    bottom: BorderSide(color: highLcolorLight, width: 0.5)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 13,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              getItPages.currentPage != '/'
                                  ? FaIcon(
                                      FontAwesomeIcons.angleLeft,
                                      color: highLcolorLight,
                                      size: 25,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 19,
                      child: InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      currentPage
                                          .setCurrentPathANDTopColorOFF('/');

                                      context.router.pushNamed('/');
                                    },
                                    child: Image.asset(
                                      'assets/logo.jpg',
                                      width: 120,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.barsStaggered,
                                  color: highLcolorLight,
                                  size: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
