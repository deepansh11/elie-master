import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Expert.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Service.dart';
import 'package:elie_web/ExpertPage/1ExpertCard.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpertPage extends StatefulWidget {
  @override
  State<ExpertPage> createState() => _ExpertPageState();
}

class _ExpertPageState extends State<ExpertPage> {
  Services? data = getItCart.serviceData;

  bool isExpert = false;
  bool loading = true;
  var firstPhone;
  List<Widget> cardList = [];
  getExperts() async {
    List<Experts?> snapshot = (await API().getExpertsByAvi(
      DateFormat('yyyy-MM-ddTHH:mm:ss')
          .format(DateFormat('dd/MM/yyyyTh:mm a').parse(getItCart.date + 'T' + getItCart.time)),
      getItCart.pin,
    ));

    if (snapshot.isNotEmpty) {
      firstPhone = snapshot.first?.phone;
      cardList = snapshot.map((e) {
        print(e!.name);

        return ExpertCard(
          img: "$baseUrl/getExpertProfilePic/${e.phone}",
          name: e.name,
          availability: e.availability ? 'Available' : 'Not Available',
          phone: e.phone,
        );
      }).toList();
    } else {
      cardList = [];
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExperts();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: NavigationDrawerWidget(context),
      backgroundColor: Colors.black,
      body: Container(
        height: screenSize.height,
        child: Stack(
          children: [
            Center(
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
                            'OUR EXPERTS',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                fontSize: 28,
                                fontFamily: 'NT'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 190,
                            left: 190,
                            bottom: 5,
                          ),
                          child: Divider(
                            thickness: 1,
                            color: highLcolor,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Choose You Expert",
                            style: TextStyle(
                              color: highLcolorLight,
                              fontSize: 25,
                              fontFamily: 'NT',
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'For ' + data!.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Responsive.responsiveNumber(14.0, 15.0, screenSize),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 290,
                            left: 290,
                            bottom: 20,
                          ),
                          child: Divider(
                            thickness: 1,
                            color: highLcolor,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        loading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: highLcolor,
                              ))
                            : Center(
                                child: cardList.isNotEmpty
                                    ? GridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        childAspectRatio: 4 / 3,
                                        mainAxisSpacing: 25,
                                        crossAxisSpacing: 20,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        crossAxisCount: isMobile(screenSize) ? 1 : 3,
                                        children: cardList,
                                      )
                                    : Container(
                                        child: Text(
                                          'Sorry! Experts Are Not Available Right Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily: 'NT',
                                          ),
                                        ),
                                      ),
                              ),
                        SizedBox(
                          height: 40,
                        ),
                        isMobile(screenSize) ? Container() : Footer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            cardList.isEmpty
                ? Container()
                : Positioned(
                    right: 15,
                    bottom: 18,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xff141414),
                          side: BorderSide(
                            color: highLcolor,
                            width: 1,
                          ),
                          primary: highLcolor,
                        ),
                        onPressed: () async {
                          getItCart.setExpertData(firstPhone);

                          if (getItCart.serviceData != null) {
                            await getItCart.addToCart(false);
                          }
                          context.router.pushNamed('/cart');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                          child: Text(
                            'Let us Choose',
                            style: TextStyle(letterSpacing: 2.0, color: Colors.white, fontSize: 15.0, fontFamily: 'NT'),
                          ),
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
