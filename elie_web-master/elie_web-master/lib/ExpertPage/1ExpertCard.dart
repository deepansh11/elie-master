import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ExpertCard extends StatelessWidget {
  const ExpertCard({
    this.img,
    this.name,
    this.availability,
    this.phone,
  });
  final img;
  final name;
  final phone;
  final availability;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        getItCart.setExpertData(phone);

        if (getItCart.serviceData != null) {
          await getItCart.addToCart(false);
        }
        context.router.pushNamed('/cart');
      },
      child: Container(
        width: screenSize.width / 6.0,
        height: screenSize.height / 2.0,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                  height: screenSize.height / 4.0,
                  child: Image.network(
                    img,
                    errorBuilder: (context, error, stack) => Image.asset('assets/avatar.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: 'NT'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$availability',
              style: TextStyle(color: highLcolor, fontSize: 15.0, fontFamily: 'NT'),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
