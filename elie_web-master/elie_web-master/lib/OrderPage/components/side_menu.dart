import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var wallet;
  getWallet() async {
    wallet = (await Dio().get('http://68.183.89.66:8001/walletBalance/${getItUserIn.userPhone}')).data;
    wallet = wallet.toString();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWallet();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff141414),
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          DrawerListTile(
            title: "Product Orders",
            svgSrc: "icons/menu_dashbord.svg",
            press: () {
              getItOrderPage.setPageIndex(2);
            },
          ),
          DrawerListTile(
            title: "Service Bookings",
            svgSrc: "icons/menu_dashbord.svg",
            press: () {
              getItOrderPage.setPageIndex(3);
            },
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: "icons/menu_setting.svg",
            press: () {
              logoutCall(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Text(
              'Wallet',
              style: TextStyle(color: highLcolorLight, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Text(
              'Total Amount: ${wallet ?? 'Rs 0'}',
              style: TextStyle(color: highLcolorDark),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  logoutCall(BuildContext c) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userPhone");
    prefs.remove("userPass");
    prefs.remove("userName");
    prefs.remove("userEmail");
    getItUserIn.userName = null;
    getItUserIn.userPhone = null;
    getItUserIn.email = null;

    c.router.pushNamed('/');
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 5.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
