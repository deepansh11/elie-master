import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Carousels/1ProductCarousel.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/ThankYouPage/Quotes.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

class ThankYouPage extends StatefulWidget {
  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

Color themeColor = highLcolor;

class _ThankYouPageState extends State<ThankYouPage> {
  Color textColor = const Color(0xFF32567A);
  AudioPlayer audioPlayer = AudioPlayer();
  var loading = false;
  playLocal() async {
    int result = await audioPlayer.play('assets/success.mp3', isLocal: true);
  }

  addOrder() async {
    await Dio().get('$baseUrl/make_send_invoice/${getItUserIn.userPhone}',
        queryParameters: {'coupon': getItCart.coupon});
    getItUserIn.ordered = false;
    setState(() {
      loading = false;
    });
  }

  updateStockData() async {
    var cart = getItForStock.cartData;

    for (var product in cart) {
      if (product.productId != null) {
        print("Product Details: ${product.productId} ${product.quantity}");

        await API().updateStock(product.productId, product.quantity);
      }
    }
  }

  @override
  void initState() {
    addOrder();
    super.initState();
    playLocal();
    // print(getItCart.cartItems);
    updateStockData();
    getItCart.clearCart();
  }

  @override
  Widget build(BuildContext context) {
    getItUserIn.ordered = false;
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        body: Center(
          child: Container(
            height: screenSize.height,
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: highLcolor,
                          ),
                        )
                      : ListView(shrinkWrap: true, children: [
                          Container(
                            height: screenSize.height /
                                Responsive.responsiveNumber(
                                    1.4, 1.5, screenSize),
                            width: screenSize.width,
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 170,
                                  padding: EdgeInsets.all(35),
                                  decoration: BoxDecoration(
                                    color: themeColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/card.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Thank You!",
                                  style: TextStyle(
                                    color: themeColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'HD',
                                    fontSize: 36,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Payment done Successfully",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    fontFamily: 'p1',
                                  ),
                                ),
                                SizedBox(height: 20),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    child: Text(
                                      'Continue Shopping',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'p2'),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.router.pushNamed('/');
                                  },
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '"' +
                                        quotesList
                                            .elementAt(Random().nextInt(11)) +
                                        '"',
                                    style: TextStyle(
                                      color: highLcolor,
                                      letterSpacing: 2,
                                      fontSize: Responsive.responsiveNumber(
                                          25.0, 30.0, screenSize),
                                      fontFamily: 'IT',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Container(
                            height: screenSize.height /
                                Responsive.responsiveNumber(2.2, 2, screenSize),
                            width: screenSize.width,
                            child: ProductCarousel(title: 'Similar Products'),
                          ),
                          isMobile(screenSize) ? Container() : Footer()
                        ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
