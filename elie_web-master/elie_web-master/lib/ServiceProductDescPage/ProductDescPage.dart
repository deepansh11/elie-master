import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Anu/Address/SavedAddress.dart';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Anu/Review.dart';
import 'package:elie_web/Carousels/1ProductCarousel.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Product.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Constants.dart';

class ProductDescPage extends StatefulWidget {
  ProductDescPage(@pathParam this.id);
  String? id;

  @override
  State<ProductDescPage> createState() => _ProductDescPageState();
}

class _ProductDescPageState extends State<ProductDescPage> {
  Product? data;

  getProductData() async {
    data = await API().getProductsByID(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Colors.black,
        body: data == null
            ? Center(
                child: CircularProgressIndicator(
                color: highLcolor,
              ))
            : Container(
                height: screenSize.height,
                child: Column(
                  children: [
                    TopBar(),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          if (screenSize.width < 940)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  '$baseUrl/getProductImageByID/${data!.id}',
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data!.productTitle.toString(),
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'NT'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${data!.aff}",
                                        style: TextStyle(
                                          color: highLcolor,
                                          fontSize: 20,
                                          fontFamily: 'IT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Starting from ₹${data!.salePrice}",
                                        style: TextStyle(
                                          color: highLcolor,
                                          fontSize: 20,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Product Description",
                                        style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'NT'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data!.productDesc.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      BuyNowBTN(data: data),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 45.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0, bottom: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        color: Color(0xff141414),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      height: screenSize.height / 2.0,
                                      child: Image.network(
                                        '$baseUrl/getProductImageByID/${data!.id}',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data!.productTitle.toString(),
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            fontFamily: 'NT'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${data!.aff}",
                                        style: TextStyle(
                                          color: highLcolor,
                                          fontSize: 20,
                                          fontFamily: 'IT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Starting from ₹${data!.salePrice.toString()}",
                                        style: TextStyle(
                                          color: highLcolor,
                                          fontSize: 20,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Product Description",
                                        style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'NT'),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        data!.productDesc,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      BuyNowBTN(
                                        data: data,
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: screenSize.height / Responsive.responsiveNumber(2.2, 2, screenSize),
                              width: screenSize.width,
                              child: ProductCarousel(),
                            ),
                          ),
                          Review(),
                          isMobile(screenSize) ? Container() : Footer()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

///////////////////BUY NOW BUTTON///////////////////BUY NOW BUTTON///////////////////BUY NOW BUTTON///////////////////BUY NOW BUTTON///////////////////BUY NOW BUTTON
class BuyNowBTN extends StatefulWidget {
  BuyNowBTN({
    Key? key,
    this.data,
  }) : super(key: key);
  final data;
  @override
  State<BuyNowBTN> createState() => _BuyNowBTNState();
}

class _BuyNowBTNState extends State<BuyNowBTN> {
  //controllers
  TextEditingController cityTextFeild = TextEditingController();
  TextEditingController stateTextFeild = TextEditingController();
  TextEditingController landmarkTextFeild = TextEditingController();
  TextEditingController houseNumberTextFeild = TextEditingController();
  TextEditingController postalTextFeild = TextEditingController();
  final RoundedLoadingButtonController btController = RoundedLoadingButtonController();

  //variables
  var locResponse;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Color(0xff141414),
            side: BorderSide(
              color: highLcolor,
              width: 1,
            ),
            primary: highLcolor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              'Buy Now',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'NT'),
            ),
          ),
          onPressed: () async {
            getItCart.setProductData(widget.data, true);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (prefs.get("userPhone") != null) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        backgroundColor: Colors.transparent,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Icon(Icons.close),
                              onTap: () => Navigator.pop(context),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: kGradiantBackground,
                                ),
                                child: SavedAddress(prefs, screenSize, false),
                                height: screenSize.height / 1.15,
                                width: screenSize.width),
                          ],
                        ),
                      ));
            } else {
              context.router.pushNamed('/LoginPage');
            }
          },
        ),
      ],
    );
  }

  TextStyle chooseAddMain() => TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle chooseAddValue() => TextStyle(
        color: Colors.white,
      );
}
