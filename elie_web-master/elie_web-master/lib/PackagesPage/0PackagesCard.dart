import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Database/API.dart';
import '../Database/Enquiry.dart';

class PackagesCard extends StatefulWidget {
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
  State<PackagesCard> createState() => _PackagesCardState();
}

class _PackagesCardState extends State<PackagesCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _loadImages(id) {
    return API().getPackagesImage(id);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final style = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'NT');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width / (isMobile(screenSize) ? 1.7 : 5.0),
        height: screenSize.height / (isMobile(screenSize) ? 4.0 : 2.0),
        child: isMobile(screenSize)
            ? Column(
                children: [
                  widget.packageCardForCarousel
                      ? SizedBox()
                      : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.name,
                                style: style.copyWith(
                                  fontSize: 33,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: " Package",
                                style: style.copyWith(
                                  fontSize: 36,
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
                    onTap: widget.packageCardForCarousel
                        ? () async {
                            print('from service tab' +
                                widget.productData.id.toString());
                            var p =
                                '/PackagesDescPage/${widget.productData.id}';
                            getItPages.setCurrentPathANDTopColorOFF(p);
                            context.router.pushNamed(p);
                            getItCart.setPackageId(widget.productData.id);
                          }
                        : () {},
                    child: CachedNetworkImage(
                      imageUrl:
                          '$baseUrl/getPackagesImageByID/${widget.productData.id}',
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          color: highLcolorDark,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: widget.packageCardForCarousel
                          ? screenSize.height / 6.0
                          : screenSize.height / 5.9,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widget.packageCardForCarousel
                      ? SizedBox()
                      : CustomButton(
                          style: style, productData: widget.productData)
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: widget.packageCardForCarousel
                        ? () async {
                            print('from service tab' +
                                widget.productData.id.toString());
                            var p =
                                '/PackagesDescPage/${widget.productData.id}';
                            getItPages.setCurrentPathANDTopColorOFF(p);
                            context.router.pushNamed(p);
                            getItCart.setPackageId(widget.productData.id);
                          }
                        : () {},
                    child: CachedNetworkImage(
                      imageUrl:
                          '$baseUrl/getPackagesImageByID/${widget.productData.id}',
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          color: highLcolorDark,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                      height: widget.packageCardForCarousel
                          ? screenSize.height / 5.9
                          : screenSize.height / 4.8,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  widget.packageCardForCarousel
                      ? SizedBox()
                      : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.name,
                                style: style.copyWith(
                                    fontSize: 31,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: " Package",
                                style: style.copyWith(
                                  fontSize: 31,
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
                  widget.packageCardForCarousel
                      ? SizedBox()
                      : CustomButton(
                          style: style, productData: widget.productData)
                ],
              ),
      ),
    );
  }
}
