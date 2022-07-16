import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Database/API.dart';
import '../Database/Enquiry.dart';

class PackagesCard extends StatelessWidget {
  PackagesCard(
      {required this.img,
      required this.name,
      required this.price,
      this.nameSize = 25.0,
      this.priceSize = 15.0,
      required this.desc,
      required this.productData,
      this.packageCardForCarousel = false});
  final Packages productData;
  final String img;
  final String name;
  final List<double>? price;
  final String desc;
  final double nameSize;
  final double priceSize;
  final bool packageCardForCarousel;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final style = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: 'NT');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width / (isMobile(screenSize) ? 1.7 : 5.0),
        height: screenSize.height / (isMobile(screenSize) ? 4.0 : 2.0),
        child: isMobile(screenSize)
            ? Column(
                children: [
                  packageCardForCarousel
                      ? SizedBox()
                      : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: name,
                                style: style.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: " Package",
                                style: style.copyWith(
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'QT',
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: packageCardForCarousel
                        ? () async {
                            print(
                                'from service tab' + productData.id.toString());
                            var p = '/PackagesDescPage/${productData.id}';
                            getItPages.setCurrentPathANDTopColorOFF(p);
                            context.router.pushNamed(p);
                            getItCart.setPackageId(productData.id);
                          }
                        : () {},
                    child: Image.network(
                      '$baseUrl/getPackagesImageByID/${productData.id}',
                      height: packageCardForCarousel
                          ? screenSize.height / 5.9
                          : screenSize.height / 4.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  packageCardForCarousel
                      ? SizedBox()
                      : CustomButton(style: style, productData: productData)
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: packageCardForCarousel
                        ? () async {
                            print(
                                'from service tab' + productData.id.toString());
                            var p = '/PackagesDescPage/${productData.id}';
                            getItPages.setCurrentPathANDTopColorOFF(p);
                            context.router.pushNamed(p);
                            getItCart.setPackageId(productData.id);
                          }
                        : () {},
                    child: Image.network(
                      '$baseUrl/getPackagesImageByID/${productData.id}',
                      fit: BoxFit.cover,
                      height: packageCardForCarousel
                          ? screenSize.height / 4.8
                          : screenSize.height / 3.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  packageCardForCarousel
                      ? SizedBox()
                      : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: name,
                                style: style.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: " Package",
                                style: style.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'QT',
                                ),
                              )
                            ],
                          ),
                        ),
                  SizedBox(
                    height: Responsive.responsiveNumber(0.0, 10.0, screenSize),
                  ),
                  packageCardForCarousel
                      ? SizedBox()
                      : CustomButton(style: style, productData: productData)
                ],
              ),
      ),
    );
  }
}
