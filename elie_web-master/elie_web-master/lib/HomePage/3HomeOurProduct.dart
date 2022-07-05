import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Routes/Routes.gr.dart';
import 'package:flutter/material.dart';

import '../Utils/Constants.dart';

class HomeOurProduct extends StatelessWidget {
  const HomeOurProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 9),
      child: Container(
        color: Color(0xff141414),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: highLcolor,
                        height: 36,
                        thickness: 0.3,
                      )),
                ),
                Text(
                  'OUR PRODUCTS',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 13, fontFamily: 'HD'),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: highLcolor,
                        height: 36,
                        thickness: 0.3,
                      )),
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              ' BEST FOR YOU ',
              style: TextStyle(
                color: highLcolor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'HD',
              ),
              textAlign: TextAlign.center,
            ),
            screenSize.width < 940
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 512 / 2, width: 512 / 2, child: Image.asset("assets/product1.png", fit: BoxFit.contain)),
                      SizedBox(
                        width: 35,
                      ),
                      SizedBox(
                          height: 500 / 2,
                          width: 500 / 2,
                          child: Image.asset(
                            "assets/product2.png",
                            fit: BoxFit.contain,
                          )),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 512 / 2, width: 512 / 2, child: Image.asset("assets/product1.png", fit: BoxFit.contain)),
                      SizedBox(
                        width: 35,
                      ),
                      SizedBox(
                          height: 500 / 2,
                          width: 500 / 2,
                          child: Image.asset(
                            "assets/product2.png",
                            fit: BoxFit.contain,
                          )),
                    ],
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Our finest products that you will fall in love with!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1,
                height: 1.4,
                fontFamily: 'p1',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff141414),
                    side: BorderSide(
                      color: highLcolor,
                      width: 1,
                    ),
                    primary: highLcolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      'EXPLORE',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 1, fontFamily: 'p2'),
                    ),
                  ),
                  onPressed: () {
                    // getItPages.setCurrentPathANDTopColorOFF(ServicesPage.id);
                    context.router.push(ProductsRoute());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
