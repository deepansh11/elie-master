import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Anu/Footer.dart';
import '../Anu/Review.dart';
import '../Carousels/2ServiceCarousel.dart';
import '../Database/API.dart';
import '../Utils/Constants.dart';
import '../Utils/NavDrawer.dart';
import '../Utils/TopBar.dart';

class PackagesDesc extends StatefulWidget {
  const PackagesDesc({Key? key, @pathParam this.id}) : super(key: key);

  final String? id;

  @override
  State<PackagesDesc> createState() => _PackagesDescState();
}

class _PackagesDescState extends State<PackagesDesc> {
  Packages? data;

  getPackageData() async {
    data = await API().getPackagesById(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPackageData();
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
                            height: 30,
                          ),
                          if (screenSize.width < 940)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Packages',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'IT'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  // "$baseUrl/getServiceImageByID/${data!.id}",
                                  data?.images?[0] ?? '',
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data?.title.toString() ?? '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              fontFamily: 'NT'),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                            text: 'Charges: ',
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 20,
                                              fontFamily: 'NT',
                                            ),
                                          ),
                                          TextSpan(
                                            text: data?.costRange ?? '',
                                            style: TextStyle(
                                              color: highLcolor,
                                              fontSize: 20,
                                              fontFamily: 'NT',
                                            ),
                                          )
                                        ])),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                            text: 'Number of Therapists: ',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 16,
                                              fontFamily: 'NT',
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '${data?.numberOfTherapists} Multitaskers',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'NT',
                                            ),
                                          )
                                        ])),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          data?.description ?? '',
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
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: highLcolor,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star_border_rounded,
                                                      color: highLcolor,
                                                    ),
                                                    Text(
                                                      data?.rating.toString() ??
                                                          '',
                                                      style: TextStyle(
                                                          color: highLcolor,
                                                          fontSize: 20,
                                                          fontFamily: 'NT'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Rating',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'NT',
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: OutlinedButton(
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
                                                'Get In Touch',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: 'NT'),
                                              ),
                                            ),
                                            onPressed: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              if (prefs.get("userPhone") !=
                                                  null) {
                                                // context.router
                                                //     .pushNamed('/ExpertPage');
                                              } else {
                                                context.router
                                                    .pushNamed('/LoginPage');
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          else
                            Column(
                              children: [
                                Text(
                                  'Packages',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'IT'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 350,
                                        child: Image.asset(
                                          // "$baseUrl/getServiceImageByID/${data!.id}",
                                          data?.images?[0] ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data?.title.toString() ?? '',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                fontFamily: 'NT'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                              text: 'Charges: ',
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 20,
                                                fontFamily: 'NT',
                                              ),
                                            ),
                                            TextSpan(
                                              text: data?.costRange ?? '',
                                              style: TextStyle(
                                                color: highLcolor,
                                                fontSize: 20,
                                                fontFamily: 'NT',
                                              ),
                                            )
                                          ])),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                              text: 'Number of Therapists: ',
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 16,
                                                fontFamily: 'NT',
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${data?.numberOfTherapists} Multitaskers',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'NT',
                                              ),
                                            )
                                          ])),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            data?.description ?? '',
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
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: highLcolor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .star_border_rounded,
                                                        color: highLcolor,
                                                      ),
                                                      Text(
                                                        data?.rating
                                                                .toString() ??
                                                            '',
                                                        style: TextStyle(
                                                            color: highLcolor,
                                                            fontSize: 20,
                                                            fontFamily: 'NT'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Rating',
                                                style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontFamily: 'NT',
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
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
                                                'Get In Touch',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: 'NT'),
                                              ),
                                            ),
                                            onPressed: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              if (prefs.get("userPhone") !=
                                                  null) {
                                                // context.router
                                                //     .pushNamed('/ExpertPage');
                                              } else {
                                                context.router
                                                    .pushNamed('/LoginPage');
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: screenSize.height /
                                  Responsive.responsiveNumber(
                                      2.2, 2, screenSize),
                              width: screenSize.width,
                              child: PackageCarousel(),
                            ),
                          ),
                          Review(),
                          isMobile(screenSize) ? Container() : Footer()
                        ],
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
