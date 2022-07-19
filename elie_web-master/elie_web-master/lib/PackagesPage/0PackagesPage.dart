import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/ButtonSwitcher.dart';
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

class PackagesPage extends StatefulWidget {
  const PackagesPage({Key? key}) : super(key: key);

  static String id = '/Packages';

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Packages',
                  style: TextStyle(
                      fontFamily: 'IT', fontSize: 51, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isMobile(screenSize) ? 0 : 200),
                child: Column(
                  children: [
                    ButtonSwitcher(),
                    Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.fromSwatch(
                        accentColor: highLcolor,
                      )),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder<List<Packages>?>(
                            future: API().getPackages(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Packages>?> snapshot) {
                              List<Widget> cartlist = [];
                              if (snapshot.hasData) {
                                for (var d in snapshot.data!) {
                                  cartlist.add(
                                    PackagesCard(
                                      img: "${d.images?[0]}",
                                      name: d.title?.replaceAll(
                                              new RegExp(r'[^\w\s]+'), '') ??
                                          '',
                                      price: d.costRange ?? [],
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
                                  crossAxisCount: isMobile(screenSize) ? 1 : 3,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isMobile(screenSize) ? Container() : Footer()
            ],
          ),
        ),
      ),
    );
  }
}
