import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Anu/Review.dart';
import 'package:elie_web/Carousels/2ServiceCarousel.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Service.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Constants.dart';

class ServiceDescPage extends StatefulWidget {
  ServiceDescPage(@pathParam this.id);
  String? id;

  @override
  State<ServiceDescPage> createState() => _ServiceDescPageState();
}

class _ServiceDescPageState extends State<ServiceDescPage> {
  Services? data = null;

  getServicesData() async {
    data = await API().getServiceByID(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    getServicesData();
    super.initState();
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
                child: Column(
                  children: [
                    TopBar(),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          if (screenSize.width < 940)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  "$baseUrl/getServiceImageByID/${data!.id}",
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data!.name.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            fontFamily: 'NT'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Starting from ₹${data!.saleCost.toString()}",
                                        style: TextStyle(
                                          color: highLcolor,
                                          fontSize: 20,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data!.desc.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff141414),
                                              side: BorderSide(
                                                color: highLcolor,
                                                width: 1,
                                              ),
                                              primary: highLcolor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 15),
                                              child: Text(
                                                'Book An Appointment',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: 'NT'),
                                              ),
                                            ),
                                            onPressed: () async {
                                              getItCart.setProductData(
                                                  data, false);
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              if (prefs.get("userPhone") !=
                                                  null) {
                                                context.router
                                                    .pushNamed('/ExpertPage');
                                              } else {
                                                context.router
                                                    .pushNamed('/LoginPage');
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          else
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 350,
                                    child: Image.network(
                                      "$baseUrl/getServiceImageByID/${data!.id}",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data!.name.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          fontFamily: 'NT'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Starting from ₹${data!.saleCost.toString()}",
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
                                      data!.desc.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'NT',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                            child: Text(
                                              'Book An Appointment',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  fontFamily: 'NT'),
                                            ),
                                          ),
                                          onPressed: () async {
                                            getItCart.setProductData(
                                                data, false);

                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            if (prefs.get("userPhone") !=
                                                null) {
                                              context.router
                                                  .pushNamed('/ExpertPage');
                                            } else {
                                              context.router
                                                  .pushNamed('/LoginPage');
                                            }
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: screenSize.height /
                                  Responsive.responsiveNumber(
                                      2.2, 2, screenSize),
                              width: screenSize.width,
                              child: ServiceCarousel(),
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
