import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/OrderPage/Screens/DashboardPage.dart';
import 'package:elie_web/OrderPage/Screens/ProductOrderDetail.dart';
import 'package:elie_web/OrderPage/Screens/ServiceBookingDetail.dart';
import 'package:elie_web/OrderPage/components/responsive.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Database/API.dart';
import '../Utils/Constants.dart';
import 'components/side_menu.dart';

class OrderPage extends StatefulWidget {
  OrderPage();

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Widget> pageList = [
    DashboardPage(),
    ProductOrderDetail(),
    ServiceBookingDetail(),
  ];
  var orderLocator = getItOrderPage;

  @override
  void initState() {
    super.initState();
    orderLocator = getItOrderPage;

    orderLocator.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        drawer: SideMenu(),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // We want this side menu only for large screen
                          if (!isMobile(screenSize))
                            Expanded(
                              // default flex = 1
                              // and it takes 1/6 part of the screen
                              child: SideMenu(),
                            ),
                          Expanded(
                            flex: 6,
                            child: pageList.elementAt(getItOrderPage.pageIndex - 1),
                          )
                        ],
                      ),
                      isMobile(screenSize) ? Container() : Footer(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
