import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Utils/GradientDivider.dart';
import 'package:flutter/material.dart';

import '../Database/API.dart';
import '../Database/Locator.dart';
import '../Database/Packages.dart';
import '../PackagesPage/0PackagesCard.dart';
import '../Utils/Constants.dart';

class PackageCarousel extends StatelessWidget {
  PackageCarousel({Key? key, this.title = 'Other Packages'}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
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
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            GradientDivider(width: screenSize.width),
            Expanded(
              child: FutureBuilder(
                future: API().getPackages(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Packages>?> snapshot) {
                  if (snapshot.hasData) {
                    var cardList = snapshot.data!
                        .map((e) => PackagesCard(
                              img: e.images?[0] ?? '',
                              name: e.title ?? '',
                              price: e.costRange ?? [],
                              desc: e.description ?? '',
                              productData: e,
                              packageCardForCarousel: true,
                            ))
                        .toList();
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch()
                            .copyWith(secondary: highLcolor),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: cardList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return cardList[index];
                        },
                      ),
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
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
              ),
              child: TextButton.icon(
                onPressed: () {
                  context.router.pushNamed('/Packages');
                  getItCart.setPackage(true);
                },
                icon: Icon(Icons.add, color: Colors.white),
                label: Text(
                  'View More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        Responsive.responsiveNumber(16.0, 20.0, screenSize),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GradientDivider(width: screenSize.width),
          ],
        ),
      ),
    );
  }
}
