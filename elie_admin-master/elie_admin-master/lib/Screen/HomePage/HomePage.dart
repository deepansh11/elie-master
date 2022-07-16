import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Login/Login.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:side_navigation/side_navigation.dart';
import '../../Responsive Dashboard/Header.dart';
import 'ListOfPages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.initialIndex}) : super(key: key);
  final int? initialIndex;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;

  var dataAdmin = getItAdminCurrentPage;
  @override
  void initState() {
    super.initState();
    pageIndex = widget.initialIndex ?? 0;

    dataAdmin.addListener(() async {
      setState(() {
        pageIndex = getItAdminCurrentPage.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: midBlue,
        elevation: 2,
        title: Header(
          selectedTile: pageIndex,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 250,
              child: SideNavigationBar(
                expandable: false,
                selectedIndex: pageIndex,
                footer: SideNavigationBarFooter(
                  label: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );

                      prefs.setBool('isLoggedIn', false);
                    },
                    child: Text('Logout'),
                  ),
                ),
                items: [
                  SideNavigationBarItem(
                    icon: Icons.dashboard_outlined,
                    label: 'Dashboard',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.share_location_outlined,
                    label: 'Tracking',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.inventory_2_outlined,
                    label: 'Product Orders',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.spa_outlined,
                    label: 'Services Booking',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.category_outlined,
                    label: 'Products',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.hot_tub_outlined,
                    label: 'Services',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.people_outlined,
                    label: 'Customer',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.manage_accounts_outlined,
                    label: 'Expert',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.reviews_outlined,
                    label: 'Reviews',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.payments_outlined,
                    label: 'Coupon',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.local_hospital_outlined,
                    label: 'SOS',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.question_answer,
                    label: 'Enquiry',
                  ),
                ],
                onTap: (int value) {
                  getItAdminCurrentPage.setIndex(value);
                  print(getItAdminCurrentPage);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: views.elementAt(pageIndex),
            ),
          )
        ],
      ),
    );
  }
}
