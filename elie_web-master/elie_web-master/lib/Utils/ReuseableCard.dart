import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({required this.color, required this.cardChild});

  //Properties
  final Color color;

  final Widget cardChild;

  //build Func
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.fromLTRB(7, 9, 7, 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: color,
      ),
    );
  }
}
