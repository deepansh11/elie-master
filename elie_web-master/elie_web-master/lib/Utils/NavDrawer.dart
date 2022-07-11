import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/HomePage/0HomePage.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Database/Locator.dart';
import 'Constants.dart';
import 'OverlaySeacrh.dart';

class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget(this.context);
  final BuildContext context;

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  var path;

  var currentPage;

  var version;

  var searchFocus = FocusNode();
  var wallet;
  getWallet() async {
    if (getItUserIn.userPhone != null) {
      wallet = (await Dio().get(
              'http://68.183.89.66:8001/walletBalance/${getItUserIn.userPhone}'))
          .data;
      wallet = wallet.toString();
      setState(() {});
    }
  }

  changePage({path = "/"}) {
    currentPage = getIt.get<Pages>();

    widget.context.router.pushNamed(path);
    currentPage.setCurrentPathANDTopColorOFF(path);
    print(currentPage.currentPage);
  }

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print("Build: ${packageInfo.buildNumber}");
    print("Version: ${packageInfo.version}");
    version = packageInfo.version.toString();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWallet();
    getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFF141414),
        child: ListView(
          children: <Widget>[
            if (getItUserIn.userPhone != null)
              buildHeader(
                wallet: wallet ?? '0',
                name: getItUserIn.userName.toString(),
                email: getItUserIn.userPhone.toString(),
                onClicked: () {},
              )
            else
              Padding(
                padding: EdgeInsets.all(20.0),
                child: buildMenuItem(
                    text: 'Login/Sign up',
                    icon: 'assets/hairdresser.png',
                    onClicked: () {
                      Navigator.pop(context);
                      changePage(path: '/LoginPage');
                    }),
              ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  OverlaySearch((v) {}, searchFocus),
                  SizedBox(height: 5),
                  buildMenuItem(
                      text: 'Salon',
                      icon: 'assets/saloni.png',
                      onClicked: () {
                        getItCart.setSpa(false);
                        Navigator.pop(context);
                        changePage(path: '/LocationChoicePage');
                      }),
                  SizedBox(height: 5),
                  buildMenuItem(
                      text: 'Spa',
                      icon: 'assets/spai.png',
                      onClicked: () {
                        getItCart.setSpa(true);

                        Navigator.pop(context);
                        changePage(path: '/LocationChoicePage');
                      }),
                  SizedBox(height: 5),
                  buildMenuItem(
                      text: 'Product',
                      icon: 'assets/cosmetics.png',
                      onClicked: () {
                        Navigator.pop(context);
                        changePage(path: '/product');
                      }),
                  SizedBox(height: 5),
                  buildMenuItem(
                      text: 'Packages',
                      icon: 'assets/cosmetics.png',
                      onClicked: () {
                        Navigator.pop(context);
                        changePage(path: '/Packages');
                      }),
                  // SizedBox(height: 5),
                  // buildMenuItem(
                  //     text: 'Education',
                  //     icon: Icons.school_outlined,
                  //     onClicked: () {
                  //       Navigator.pop(context);
                  //       changePage(path: HomePage.id);
                  //     }),
                  // SizedBox(height: 5),
                  // buildMenuItem(
                  //     text: 'Fitness',
                  //     icon: Icons.fitness_center_outlined,
                  //     onClicked: () {
                  //       Navigator.pop(context);
                  //       changePage(path: HomePage.id);
                  //     }),
                  // SizedBox(height: 5),
                  // buildMenuItem(
                  //     text: 'Events',
                  //     icon: Icons.event_outlined,
                  //     onClicked: () {
                  //       Navigator.pop(context);
                  //       changePage(path: HomePage.id);
                  //     }),
                  SizedBox(height: 5),
                  buildMenuItem(
                      text: 'Tattoo',
                      icon: 'assets/ttt.png',
                      onClicked: () {
                        Navigator.pop(context);
                        changePage(path: '/Tattoo');
                      }),
                  SizedBox(height: 5),
                  getItUserIn.userPhone != null
                      ? buildMenuItem(
                          text: 'Product Orders',
                          icon: 'assets/card.png',
                          onClicked: () {
                            Navigator.pop(context);
                            getItOrderPage.setPageIndex(2);
                            changePage(path: '/OrderPage');
                          },
                        )
                      : Container(),
                  getItUserIn.userPhone != null
                      ? buildMenuItem(
                          text: 'Service Bookings',
                          icon: 'assets/card.png',
                          onClicked: () {
                            Navigator.pop(context);
                            getItOrderPage.setPageIndex(3);
                            changePage(path: '/OrderPage');
                          },
                        )
                      : Container(),
                  SizedBox(height: 6),
                  Divider(color: highLcolorLight),
                  SizedBox(height: 6),
                  buildMenuItem(
                      text: 'Contact Us',
                      icon: 'assets/therapy.png',
                      onClicked: () {
                        Navigator.pop(context);
                        changePage(path: HomePage.id);
                      }),
                  SizedBox(height: 5),
                  getItUserIn.userPhone != null
                      ? buildMenuItem(
                          text: 'Cart',
                          icon: 'assets/shopping-bag.png',
                          onClicked: () {
                            Navigator.pop(context);
                            changePage(path: '/cart');
                          })
                      : Container(),
                  SizedBox(height: 6),
                  Divider(color: highLcolorLight),
                  SizedBox(height: 6),
                  getItUserIn.userPhone != null
                      ? buildMenuItem(
                          text: 'Logout',
                          icon: 'assets/logout.png',
                          onClicked: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove("userPhone");
                            prefs.remove("userPass");
                            prefs.remove("userName");
                            prefs.remove("userEmail");
                            getItUserIn.userName = null;
                            getItUserIn.userPhone = null;
                            getItUserIn.email = null;
                            context.router.pushNamed('/');
                            Navigator.pop(context);
                          })
                      : Container(),
                  SizedBox(height: 36),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Color(0x1D1D1D).withOpacity(1);
                          } else if (states.contains(MaterialState.pressed)) {
                            return Color(0x212121).withOpacity(1);
                          }
                          return Colors.transparent;
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color(0xeb9571).withOpacity(1);
                        if (states.contains(MaterialState.pressed))
                          return Color(0xeb9571).withOpacity(1);
                        return Colors.white;
                        // null throus error in flutter 2.2+.
                      }),
                    ),
                    onPressed: () {
                      context.router.pushNamed("/Policy");
                    },
                    child: Text('Privacy Policy'),
                  ),
                  SizedBox(height: 6),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Color(0x1D1D1D).withOpacity(1);
                          } else if (states.contains(MaterialState.pressed)) {
                            return Color(0x212121).withOpacity(1);
                          }
                          return Colors.transparent;
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color(0xeb9571).withOpacity(1);
                        if (states.contains(MaterialState.pressed))
                          return Color(0xeb9571).withOpacity(1);
                        return Colors.white;
                        // null throus error in flutter 2.2+.
                      }),
                    ),
                    onPressed: () {
                      context.router.pushNamed("/Terms");
                    },
                    child: Text('Terms Of Service'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Version: $version',
                    style: TextStyle(
                      color: highLcolorDark.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String wallet,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 14),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Wallet Balance: $wallet',
                      style: TextStyle(fontSize: 14, color: highLcolor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required String icon,
    VoidCallback? onClicked,
  }) {
    final color = highLcolorLight;
    final hoverColor = Colors.black87;

    return ListTile(
      leading: Image.asset(
        icon,
        width: 35,
        color: highLcolor,
      ),
      title: Text(text,
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontFamily: 'NT',
              fontSize: 16,
              fontWeight: FontWeight.w700)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
