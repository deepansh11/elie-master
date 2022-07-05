import 'package:flutter/cupertino.dart';

var highLcolor = Color(0xffebab8b);
var highLcolorLight = Color(0xfff5b595);
var highLcolorDark = Color(0xffA36E53);

class Responsive {
  static responsiveNumber(var min, var max, Size screenSize, {breakPoint = 720}) {
    return isMobile(screenSize) ? min : max;
  }
}

isMobile(screenSize) => screenSize.width < 720 ? true : false;

bool decideWhichDayToEnable(DateTime day) {
  if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
      day.isBefore(DateTime.now().add(Duration(days: 30))))) {
    return true;
  }
  return false;
}

var baseUrl = 'https://api.elie.world';

var kGradiantButton = LinearGradient(begin: FractionalOffset.topRight, end: FractionalOffset.bottomLeft, stops: [
  0.2,
  0.5,
  0.6,
  0.9
], colors: [
  Color(0xA2735A).withOpacity(1),
  Color(0xD8A890).withOpacity(1),
  Color(0xF2D4C1).withOpacity(1),
  Color(0xBE8E75).withOpacity(1)
]);

var kGradiantBackground = LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, stops: [
  0.3,
  0.6,
  0.9
], colors: [
  Color(0x101010).withOpacity(1),
  Color(0x242424).withOpacity(1),
  Color(0x000000).withOpacity(1),
]);

officeTime(date) {
  print((double.parse(DateTime.now().hour.toString()) == 23.0 && DateTime.now().day == date.day));
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
      ? ((double.parse(DateTime.now().hour.toString()) == 22.0 && DateTime.now().day == date.day) ||
              (double.parse(DateTime.now().hour.toString()) == 23.0 && DateTime.now().day == date.day))
          ? null
          : 9.0
      : DateTime.now().day != date.day
          ? 9.0
          : double.parse(DateTime.now().add(Duration(hours: 1)).hour.toString());
}
