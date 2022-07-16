import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';

class EnquiryRegistered extends StatelessWidget {
  const EnquiryRegistered({
    Key? key,
  }) : super(key: key);

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
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Thank you for registering with us. We will get back to you shortly.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 25,
                          fontFamily: 'NT'),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff141414),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                        color: highLcolor,
                        width: 1,
                      ),
                      primary: highLcolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      child: Text(
                        'Continue Shopping',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'NT'),
                      ),
                    ),
                    onPressed: () async {
                      getItCart.setPackage(false);
                      context.router.pushNamed('/');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
