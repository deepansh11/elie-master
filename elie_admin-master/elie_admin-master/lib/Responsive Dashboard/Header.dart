import 'package:elie_admin/Responsive%20Dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class Header extends StatelessWidget {
  Header({Key? key, required this.selectedTile}) : super(key: key);

  var selectedTile = 1;

  List title = [
    "Dashboard",
    'Tracking',
    'Products Orders',
    'Services Orders',
    'Products',
    'Services',
    'Customers',
    'Experts',
    'Reviews',
    'Coupon',
    'SOS Emergency',
    'Add Product',
    'Add Service',
    'Add Expert',
    'Add Customer',
    'Edit Product',
    'Edit Service',
    'Edit Customer',
    'Edit Expert',
    'Add Service Order',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        if (!Responsive.isMobile(context))
          Text(
            title[selectedTile],
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0 / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 / 2),
              child: Text("Dr Elie"),
            ),
        ],
      ),
    );
  }
}
