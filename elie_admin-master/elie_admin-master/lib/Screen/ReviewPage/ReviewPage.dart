import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Database/API.dart';

import 'package:elie_admin/Database/Product.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/ReviewPage/ReviewCard.dart';
import 'package:elie_admin/Screen/Widgets/ActionButtons.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Utils/OverlayStatus.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage();

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late List<Widget> reviewList = [];
  var loading = true;

  getReview() async {
    reviewList = [];
    List reviews = (await Dio().get('$baseURL/get_all_reviews')).data;

    for (var item in reviews) {
      reviewList.add(ReviewCard(
        item: item,
      ));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getReview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : GridView.count(
                childAspectRatio: 1 / .6,
                crossAxisCount: 3,
                children: reviewList,
              ));
  }
}
