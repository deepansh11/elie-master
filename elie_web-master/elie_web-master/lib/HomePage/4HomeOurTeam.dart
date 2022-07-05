import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

import '4TeamCard.dart';

class HomeOurTeam extends StatelessWidget {
  const HomeOurTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    List<Widget> teamCards = [
      TeamCard(
        name: 'Aamir Ansari',
        img: "assets/Aamir Ansari .jpg",
        decs: "Hairdresser",
      ),
      TeamCard(
        name: 'Dr. Dhvani Vasa',
        img: "assets/Dr. Dhvani Vasa.jpg",
        decs: "Senior Stylist",
      ),
      TeamCard(
        name: 'Lalhmunsiami',
        img: "assets/Lalhmunsiami.jpg",
        decs: "Master Massaur",
      ),
    ];

    return Container(
      color: Color(0xff141414),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                    child: Divider(
                      color: highLcolor,
                      height: 36,
                      thickness: 0.3,
                    )),
              ),
              Text(
                'OUR EXPERTS',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 4, fontSize: 13, fontFamily: 'NT'),
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 40.0),
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
            Text(
              ' MEET OUR TEAM ',
              style: TextStyle(
                color: highLcolor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontFamily: 'NT',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: isMobile(screenSize) ? 1.04 : 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: isMobile(screenSize) ? 1 : 3,
                children: teamCards,
              ),
            )
          ],
        ),
      ),
    );
  }
}
