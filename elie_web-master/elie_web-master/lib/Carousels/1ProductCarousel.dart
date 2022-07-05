import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Product.dart';
import 'package:elie_web/ProductsPage/1ServiceProductCard.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  ProductCarousel({Key? key, this.title = 'Frequently Added'}) : super(key: key);
  var title;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff141414),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Responsive.responsiveNumber(16.0, 20.0, screenSize),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: FutureBuilder(
                future: getItUserIn.userPhone != null ? API().getProductsExceptCart(getItUserIn.userPhone) : API().getProducts(),
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
                    return ListView.builder(
                      itemCount: cardList.length,
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return cardList[index];
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
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
            ),
          ],
        ),
      ),
    );
  }
}
