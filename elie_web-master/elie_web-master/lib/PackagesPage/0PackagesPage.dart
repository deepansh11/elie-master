import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Anu/Footer.dart';
import '../Database/API.dart';
import '../ProductsPage/1ServiceProductCard.dart';
import '../Utils/TopBar.dart';
import '0PackagesCard.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({Key? key}) : super(key: key);

  static String id = '/Packages';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Colors.black,
        body: Container(
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
                      Center(
                        child: Text(
                          "Book A Package",
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
                      FutureBuilder<List<Packages>?>(
                        future: API().getPackages(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Packages>?> snapshot) {
                          print(snapshot.data?[0].toJson());
                          List<Widget> cartlist = [];
                          if (snapshot.hasData) {
                            for (var d in snapshot.data!) {
                              cartlist.add(
                                PackagesCard(
                                  img: "${d.images?[0]}",
                                  name: d.title?.replaceAll(
                                          new RegExp(r'[^\w\s]+'), '') ??
                                      '',
                                  price: d.costRange ?? '',
                                  desc: d.description ?? '',
                                  productData: d,
                                ),
                              );
                            }
                            print(cartlist);
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
            )),
      ),
    );
  }
}
