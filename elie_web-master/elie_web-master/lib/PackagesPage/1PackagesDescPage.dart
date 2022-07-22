import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elie_web/Database/Enquiry.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/GradientDivider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Anu/Footer.dart';
import '../Anu/Review.dart';
import '../Carousels/3PackageCarousel.dart';
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
    String priceString() {
      String p = '';
      if (data?.costRange?.length == 1 && data?.durationRange?.length == 1) {
        p = '\u{20B9}${data?.costRange?[0]} for ${data?.durationRange?[0]} hrs';
        return p;
      } else if (data?.costRange?.length == data?.durationRange?.length &&
          data?.costRange != null &&
          data!.costRange!.length > 1) {
        for (var i = 0; i < data!.costRange!.length; i++) {
          p = i > 0
              ? '\u{20B9}${data?.costRange?[i - 1]} for ${data?.durationRange?[i - 1]} hrs, \u{20B9}${data?.costRange?[i]} for ${data?.durationRange?[i]} hrs'
              : '${data?.costRange?[i]} for ${data?.durationRange?[i]} hrs';
        }
        return p;
      } else {
        p = 'Negotiable';
        return p;
      }
    }

    String durationString() {
      String d = '';
      if (data?.durationRange?.length == 1) {
        d = '${data?.durationRange?[0]} hrs';
        return d;
      } else if (data?.durationRange?.length != null &&
          data!.durationRange!.length >= 1) {
        for (var i = 0; i < data!.costRange!.length; i++) {
          d = i > 0
              ? '${data?.durationRange?[i - 1]} hrs/${data?.durationRange?[i]} hrs'
              : '${data?.durationRange?[i]} hrs';
        }
        return d;
      } else {
        d = 'Negotiable';
        return d;
      }
    }

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
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Book an',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 32,
                                            fontFamily: 'NT'),
                                      ),
                                      TextSpan(
                                        text: ' Appointment',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 37,
                                            fontFamily: 'QT'),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: GradientDivider(
                                    width: screenSize.width,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: data?.title.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      TextSpan(
                                        text: " Package",
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'QT',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: CachedNetworkImage(
                                    // "$baseUrl/getServiceImageByID/${data!.id}",

                                    imageUrl:
                                        '$baseUrl/getPackagesImageByID/${data?.id}',
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        value: progress.progress,
                                        color: highLcolorDark,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Duration: ',
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 16,
                                                  fontFamily: 'NT',
                                                ),
                                              ),
                                              TextSpan(
                                                text: durationString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'NT',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Charges: ${priceString()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NT',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          data?.description
                                                  ?.replaceAll('\\n', '') ??
                                              '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'NT',
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                              ),
                                              side: BorderSide(
                                                color: highLcolor,
                                                width: 1,
                                              ),
                                              primary: highLcolor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                              child: Text(
                                                'Get In Touch',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 20,
                                                    fontFamily: 'NT'),
                                              ),
                                            ),
                                            onPressed: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              if (prefs.get("userPhone") !=
                                                  null) {
                                                var userName =
                                                    prefs.get("userName");
                                                var userEmail =
                                                    prefs.get("userEmail");
                                                var userPhone =
                                                    prefs.get("userPhone");

                                                var parsedJson = Enquiry(
                                                    userName.toString(),
                                                    userEmail.toString(),
                                                    userPhone.toString(),
                                                    false,
                                                    false,
                                                    data,
                                                    '',
                                                    '',
                                                    false,
                                                    data?.numberOfTherapists,
                                                    '',
                                                    0,
                                                    0,
                                                    0);

                                                await API()
                                                    .addEnquiry(parsedJson);

                                                context.router
                                                    .pushNamed('/Enquiry');
                                              } else {
                                                context.router
                                                    .pushNamed('/LoginPage');
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 200,
                              ),
                              child: Column(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Book an',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 35,
                                              fontFamily: 'NT'),
                                        ),
                                        TextSpan(
                                          text: ' Appointment',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 45,
                                              fontFamily: 'QT'),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: CachedNetworkImage(
                                          // "$baseUrl/getServiceImageByID/${data!.id}",
                                          imageUrl:
                                              '$baseUrl/getPackagesImageByID/${data?.id}',
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  Center(
                                            child: CircularProgressIndicator(
                                              value: progress.progress,
                                              color: highLcolorDark,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),

                                          fit: BoxFit.cover,
                                          height: 350,
                                          width: 150,
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        data?.title.toString(),
                                                    style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: " Package",
                                                    style: TextStyle(
                                                      fontSize: 38,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'QT',
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
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
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Duration: ',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 16,
                                                      fontFamily: 'NT',
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: durationString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'NT',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Charges: ${priceString()}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'NT',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              data?.description?.replaceAll(
                                                      '\\n', '\n') ??
                                                  '',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'NT',
                                              ),
                                              softWrap: true,
                                              overflow: TextOverflow.clip,
                                            ),
                                            SizedBox(
                                              height: 90,
                                            ),
                                            OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    20,
                                                  ),
                                                ),
                                                side: BorderSide(
                                                  color: highLcolor,
                                                  width: 1,
                                                ),
                                                primary: highLcolor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                child: Text(
                                                  'Get In Touch',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 25,
                                                      fontFamily: 'NT'),
                                                ),
                                              ),
                                              onPressed: () async {
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                if (prefs.get("userPhone") !=
                                                    null) {
                                                  var userName =
                                                      prefs.get("userName");
                                                  var userEmail =
                                                      prefs.get("userEmail");
                                                  var userPhone =
                                                      prefs.get("userPhone");

                                                  var parsedJson = Enquiry(
                                                      userName.toString(),
                                                      userEmail.toString(),
                                                      userPhone.toString(),
                                                      false,
                                                      false,
                                                      data,
                                                      '',
                                                      '',
                                                      false,
                                                      data?.numberOfTherapists,
                                                      '',
                                                      0,
                                                      0,
                                                      0);

                                                  await API()
                                                      .addEnquiry(parsedJson);

                                                  context.router
                                                      .pushNamed('/Enquiry');
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
                            ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.responsiveNumber(
                                    20.0, 200.0, screenSize)),
                            child: Container(
                              height: screenSize.height /
                                  Responsive.responsiveNumber(
                                      2.2, 2, screenSize),
                              width: screenSize.width,
                              child: PackageCarousel(
                                id: data?.id ?? 0,
                              ),
                            ),
                          ),
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
