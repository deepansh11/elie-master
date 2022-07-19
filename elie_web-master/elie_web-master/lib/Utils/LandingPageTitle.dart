import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPageTitle extends StatelessWidget {
  const LandingPageTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: highLcolor, fontFamily: 'NT', fontSize: 35);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              border: Border.all(
                color: highLcolor,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 8,
            ),
            child: Center(
              child: Text(
                title,
                style: style.copyWith(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
