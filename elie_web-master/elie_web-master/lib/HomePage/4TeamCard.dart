import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({this.name, this.img, this.decs});
  final name;
  final img;
  final decs;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            img,
            fit: BoxFit.fill,
            width: 580,
            height: 580,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile(screenSize) ? 20 : 30,
                        fontFamily: 'NT',
                      ),
                    ),
                    Text(
                      decs.toString(),
                      style: TextStyle(
                        color: highLcolorLight,
                        fontSize: isMobile(screenSize) ? 15 : 20,
                        fontFamily: 'NT',
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
