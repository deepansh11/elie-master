import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var highLcolor = Color(0xffebab8b);
var highLcolorLight = Color(0xfff5b595);
var highLcolorDark = Color(0xffA36E53);

class Responsive {
  static responsiveNumber(var min, var max, Size screenSize,
      {breakPoint = 720}) {
    return isMobile(screenSize) ? min : max;
  }
}

enum Device { mobile, tablet, desktop }

isMobile(screenSize) => screenSize.width < 720 ? true : false;

class TrueResponsive {
  static Device screenSize(Size screen) {
    if (screen.width < 600)
      return Device.mobile;
    else if (screen.width < 1200)
      return Device.tablet;
    else
      return Device.desktop;
  }
}

bool decideWhichDayToEnable(DateTime day) {
  if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
      day.isBefore(DateTime.now().add(Duration(days: 30))))) {
    return true;
  }
  return false;
}

BoxDecoration gradientColor = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(25)),
  gradient: LinearGradient(
    colors: [
      highLcolorLight,
      highLcolorDark,
    ],
    stops: [0.2, 0.8],
  ),
);

const dataForLanding =
    ''' There’s an old adage about working smart, rather than working hard. It’s been tried and tested. 
It’s been proven to be effective. So, why then, do we insist on complicating our everyday skincare 
routines with cabinets full of products and long, drawn out skincare regimens?
Dr. Elie Organics is your expert skincare solution that minimises time and maximises efficacy. 
Created by Dr. Elie herself, our products are made with the highest quality ingredients, developed 
through extensive clinical research, and designed to ensure that maintaining everyday skincare 
doesn’t take all day.''';

var baseUrl = 'https://api.elie.world';

var kGradiantButton = LinearGradient(
    begin: FractionalOffset.topRight,
    end: FractionalOffset.bottomLeft,
    stops: [
      0.2,
      0.5,
      0.6,
      0.9
    ],
    colors: [
      Color(0xA2735A).withOpacity(1),
      Color(0xD8A890).withOpacity(1),
      Color(0xF2D4C1).withOpacity(1),
      Color(0xBE8E75).withOpacity(1)
    ]);

var kGradiantBackground = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [
      0.3,
      0.6,
      0.9
    ],
    colors: [
      Color(0x101010).withOpacity(1),
      Color(0x242424).withOpacity(1),
      Color(0x000000).withOpacity(1),
    ]);

officeTime(date) {
  return (double.parse(DateTime.now().hour.toString()) == 0.0 ||
          (double.parse(DateTime.now().hour.toString()) == 1.0) ||
          (double.parse(DateTime.now().hour.toString()) == 2.0) ||
          (double.parse(DateTime.now().hour.toString()) == 3.0) ||
          (double.parse(DateTime.now().hour.toString()) == 4.0) ||
          (double.parse(DateTime.now().hour.toString()) == 5.0) ||
          (double.parse(DateTime.now().hour.toString()) == 6.0) ||
          (double.parse(DateTime.now().hour.toString()) == 7.0) ||
          (double.parse(DateTime.now().hour.toString()) == 8.0) ||
          double.parse(DateTime.now().hour.toString()) == 22.0 ||
          double.parse(DateTime.now().hour.toString()) == 23.0)
      ? ((double.parse(DateTime.now().hour.toString()) == 22.0 &&
                  DateTime.now().day == date.day) ||
              (double.parse(DateTime.now().hour.toString()) == 23.0 &&
                  DateTime.now().day == date.day))
          ? null
          : 9.0
      : DateTime.now().day != date.day
          ? 9.0
          : double.parse(
              DateTime.now().add(Duration(hours: 1)).hour.toString());
}
