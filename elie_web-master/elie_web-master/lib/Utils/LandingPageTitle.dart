import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPageTitle extends StatelessWidget {
  const LandingPageTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var style = TextStyle(
      color: highLcolor,
      fontFamily: 'NT',
      fontSize: Responsive.responsiveNumber(18, 32, screenSize),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: isMobile(screenSize) ? 83 : 203,
          height: 48,
          alignment: Alignment.center,
          decoration: gradientColor,
          child: Container(
            width: isMobile(screenSize) ? 80 : 200,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Center(
                child: Text(
                  title,
                  style: style.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
