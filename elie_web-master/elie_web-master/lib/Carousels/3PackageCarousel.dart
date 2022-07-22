import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Utils/GradientDivider.dart';
import 'package:flutter/material.dart';

import '../Database/API.dart';
import '../Database/Locator.dart';
import '../Database/Packages.dart';
import '../PackagesPage/0PackagesCard.dart';
import '../Utils/Constants.dart';

class PackageCarousel extends StatelessWidget {
  PackageCarousel({Key? key, this.title = 'Other Packages', required this.id})
      : super(key: key);
  final String title;
  final int id;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                        .map((e) => (id != e.id)
                            ? PackagesCard(
                                img: '$baseUrl/getPackagesImageByID/${e.id}',
                                name: e.title ?? '',
                                price: e.costRange ?? [],
                                desc: e.description ?? '',
                                productData: e,
                                packageCardForCarousel: true,
                              )
                            : Container())
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
