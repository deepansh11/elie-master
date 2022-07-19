import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Service.dart';
import 'package:elie_web/ProductsPage/1ServiceProductCard.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Colors.black,
        body: Container(
          height: screenSize.height,
          child: Center(
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
                      Center(
                        child: Text(
                          "Book A Service",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              fontSize: 18,
                              fontFamily: 'NT'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<List<Services>>(
                        future: API().getServices(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Services>> snapshot) {
                          List<Widget> cartlist = [];
                          if (snapshot.hasData) {
                            for (var d in snapshot.data!) {
                              if (d.isSpa && getItCart.isSpa) {
                                cartlist.add(ServiceProductCard(
                                  img: "$baseUrl/getServiceImageByID/${d.id}",
                                  name: d.name
                                      .replaceAll(new RegExp(r'[^\w\s]+'), ''),
                                  price: d.saleCost,
                                  desc: d.desc,
                                  productData: d,
                                  isProduct: false,
                                ));
                              }
                              if (!d.isSpa && !getItCart.isSpa) {
                                cartlist.add(ServiceProductCard(
                                  img: "$baseUrl/getServiceImageByID/${d.id}",
                                  name: d.name
                                      .replaceAll(new RegExp(r'[^\w\s]+'), ''),
                                  price: d.saleCost,
                                  desc: d.desc,
                                  productData: d,
                                  isProduct: false,
                                ));
                              }
                            }

                            return GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              childAspectRatio: 1,
                              mainAxisSpacing: 25,
                              crossAxisSpacing: 20,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: isMobile(screenSize) ? 1 : 4,
                              children: cartlist,
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: highLcolorDark,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      isMobile(screenSize) ? Container() : Footer()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
