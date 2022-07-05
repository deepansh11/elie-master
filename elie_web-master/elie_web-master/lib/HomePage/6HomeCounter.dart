import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class HomeCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> counterList = [
      CounterCard("assets/braid.png", "+3500", "Happy Customers"),
      CounterCard("assets/salon-chair.png", "4", "Salons"),
      CounterCard("assets/hairdresser.png", "+200", "Generous Employees"),
      CounterCard("assets/c4.png", "45k", "Instagram Followers"),
    ];
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(isMobile(screenSize) ? 20 : 20.0),
      child: Container(
        height: screenSize.height / (isMobile(screenSize) ? 4.0 : 4.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: counterList,
          ),
        ),
      ),
    );
  }
}

class CounterCard extends StatelessWidget {
  CounterCard(this.img, this.text, this.desc);

  final img, text, desc;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            img,
            color: highLcolor,
            width: isMobile(screenSize) ? 40.0 : 80.0,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text.toString(),
            style: TextStyle(color: highLcolor, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'HD'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            desc.toString(),
            style: TextStyle(color: Colors.white, fontSize: Responsive.responsiveNumber(12.0, 16.0, screenSize), fontFamily: 'P1'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

//Column(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [counterList[0], counterList[1]],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [counterList[2], counterList[3]],
//                     ),
//                   )
//                 ],
//               )
