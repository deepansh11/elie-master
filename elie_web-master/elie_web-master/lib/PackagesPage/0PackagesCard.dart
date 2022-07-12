import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class PackagesCard extends StatelessWidget {
  PackagesCard({
    required this.img,
    required this.name,
    required this.price,
    this.nameSize = 25.0,
    this.priceSize = 15.0,
    required this.desc,
    required this.productData,
  });
  final Packages productData;
  final String img;
  final String name;
  final String price;
  final String desc;
  final double nameSize;
  final double priceSize;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width / (isMobile(screenSize) ? 1.7 : 5.0),
        height: screenSize.height / (isMobile(screenSize) ? 4.0 : 2.0),
        child: isMobile(screenSize)
            ? Column(
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.responsiveNumber(
                            nameSize - 6.0, nameSize, screenSize),
                        fontFamily: 'NT'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xff141414),
                      ),
                      clipBehavior: Clip.antiAlias,
                      height: screenSize.height / 3.0,
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      print('from service tab' + productData.id.toString());
                      var p = '/PackagesDescPage/${productData.id}';
                      getItPages.setCurrentPathANDTopColorOFF(p);
                      context.router.pushNamed(p);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff141414),
                      side: BorderSide(
                        color: highLcolor,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: highLcolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Text(
                        'Get In Touch',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'NT'),
                      ),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xff141414),
                      ),
                      clipBehavior: Clip.antiAlias,
                      height: screenSize.height / 3.0,
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.responsiveNumber(
                            nameSize - 6.0, nameSize, screenSize),
                        fontFamily: 'NT'),
                  ),
                  SizedBox(
                    height: Responsive.responsiveNumber(0.0, 10.0, screenSize),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: highLcolor,
                        fontSize: Responsive.responsiveNumber(
                            priceSize - 2.0, priceSize, screenSize),
                        fontFamily: 'NT'),
                  ),
                ],
              ),
      ),
    );
  }
}
