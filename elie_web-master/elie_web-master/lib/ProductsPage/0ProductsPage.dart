import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Product.dart';
import 'package:elie_web/ProductsPage/1ServiceProductCard.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  static String id = '/ProductsPage';
  ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<Product>> cards;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards = API().getProducts();
  }

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
                          'Products',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 28, fontFamily: 'NT'),
                        ),
                      ),
                      SizedBox(
                        height: Responsive.responsiveNumber(10.0, 20.0, screenSize),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Divider(
                                color: highLcolor,
                                height: 36,
                                thickness: 0.3,
                              )),
                        ),
                        Text(
                          'BEST BEAUTY PRODUCTS',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 18, fontFamily: 'NT'),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Divider(
                                color: highLcolor,
                                height: 36,
                                thickness: 0.3,
                              )),
                        ),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      FutureBuilder<List<Product>>(
                        future: API().getProducts(),
                        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
                          if (snapshot.hasData) {
                            var cardList = snapshot.data!
                                .map((e) => ServiceProductCard(
                                      img: "$baseUrl/getProductImageByID/${e.id}",
                                      name: e.productTitle,
                                      price: e.salePrice,
                                      desc: e.productDesc,
                                      productData: e,
                                      isProduct: true,
                                    ))
                                .toList();

                            return GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              childAspectRatio: 1,
                              mainAxisSpacing: 25,
                              crossAxisSpacing: 20,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: isMobile(screenSize) ? 1 : 4,
                              children: cardList,
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
