import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              highLcolor,
              Colors.grey.shade700,
            ],
            stops: [0.2, 0.8],
          ),
        ),
      ),
    );
  }
}
