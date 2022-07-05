import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../Anu/Address/SavedAddress.dart';
import '../DateNightTime/lib/constants.dart';
import '../DateNightTime/lib/daynight_timepicker.dart';
import 'package:intl/intl.dart';

class LocationCard extends StatefulWidget {
  LocationCard({this.name, this.img, this.decs, this.atHome = false, this.lat, this.long, this.pin});
  final name;
  final img;
  final decs;
  var atHome;
  final lat;
  final long;
  final pin;

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  //controllers
  TextEditingController cityTextFeild = TextEditingController();
  TextEditingController stateTextFeild = TextEditingController();
  TextEditingController landmarkTextFeild = TextEditingController();
  TextEditingController houseNumberTextFeild = TextEditingController();
  TextEditingController postalTextFeild = TextEditingController();
  final RoundedLoadingButtonController btController = RoundedLoadingButtonController();

  //variables
  DateTime selectedDate = DateTime.now();
  var date;
  var time = '';

  //disposing
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cityTextFeild.dispose();
    stateTextFeild.dispose();
    landmarkTextFeild.dispose();
    houseNumberTextFeild.dispose();
    postalTextFeild.dispose();
  }

//LocationPage build
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height / 3,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: highLcolorLight),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'NT',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Image.asset(
                widget.img,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.decs.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile(screenSize) ? 14 : 17,
                  fontFamily: 'p1',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff141414),
                      side: BorderSide(
                        color: highLcolor,
                        width: 1,
                      ),
                      primary: highLcolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                      child: Text(
                        'Book Now',
                        style: TextStyle(letterSpacing: 2.0, color: Colors.white, fontSize: 15.0, fontFamily: 'NT'),
                      ),
                    ),
                    onPressed: () async {
                      ///////////////////AT HOME////////////////AT HOME///////////////////////AT HOME///////////////////////AT HOME///////////////////////AT HOME///////////////////////AT HOME///////////////////////
                      if (widget.pin == 00) {
                        context.router.pushNamed('/LocationPage');
                      } else if (widget.atHome) {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if (prefs.get("userPhone") != null) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    contentPadding: EdgeInsets.all(0),
                                    backgroundColor: Colors.transparent,
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Icon(Icons.close),
                                          onTap: () => Navigator.pop(context),
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                              gradient: kGradiantBackground,
                                            ),
                                            child: SavedAddress(prefs, screenSize, true),
                                            height: screenSize.height / 1.15,
                                            width: screenSize.width / 1),
                                      ],
                                    ),
                                  ));
                        } else {
                          context.router.pushNamed('/LoginPage');
                        }
                      } else {
                        ///////////////////////AT SALON///////////////////////AT SALON///////////////////////AT SALON///////////////////////AT SALON
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if (prefs.get("userPhone") != null) {
                          getItCart.setLocation(widget.name);
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          showDialog(
                              context: this.context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Color(0xff141414),
                                    title: Text(
                                      'Choose your Date for service',
                                      style: TextStyle(
                                        color: highLcolor,
                                        fontSize: 20.0,
                                        fontFamily: 'NT',
                                      ),
                                    ),
                                    content: Container(
                                      height: screenSize.height / 2,
                                      width: 400.0,
                                      child: SfDateRangePicker(
                                        selectionTextStyle: TextStyle(fontSize: 15.0, color: Colors.white70),
                                        selectionColor: highLcolor,
                                        todayHighlightColor: highLcolorDark,
                                        selectionRadius: 90.0,
                                        selectionShape: DateRangePickerSelectionShape.rectangle,
                                        headerHeight: 100.0,
                                        headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
                                        showNavigationArrow: true,
                                        monthCellStyle: DateRangePickerMonthCellStyle(
                                          textStyle: TextStyle(fontFamily: "tex", color: Colors.white, fontSize: 16.0),
                                          disabledDatesTextStyle: TextStyle(fontStyle: FontStyle.normal, color: Colors.white54),
                                        ),
                                        selectableDayPredicate: decideWhichDayToEnable,
                                        backgroundColor: Colors.black,
                                        allowViewNavigation: false,
                                        onSelectionChanged: (value) {
                                          this.date = value.value;
                                        },
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Color(0xff141414),
                                                side: BorderSide(
                                                  color: highLcolor,
                                                  width: 1.0,
                                                ),
                                                primary: highLcolor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Responsive.responsiveNumber(4.0, 40.0, screenSize), vertical: 10.0),
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'NT'),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Color(0xff141414),
                                                side: BorderSide(
                                                  color: highLcolor,
                                                  width: 1.0,
                                                ),
                                                primary: highLcolor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: isMobile(screenSize) ? 2.0 : 40.0, vertical: 10.0),
                                                child: Text(
                                                  'Choose your time',
                                                  style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'NT'),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (date == null) {
                                                  showTopSnackBar(
                                                    context,
                                                    CustomSnackBar.error(
                                                      backgroundColor: Colors.red,
                                                      message: "Please Select a date",
                                                    ),
                                                  );
                                                } else {
                                                  print(double.parse(DateTime.now().hour.toString()));

                                                  getItCart.setDate(DateFormat('dd/MM/yyyy').format(date).toString());

                                                  print(officeTime(date));
                                                  if (officeTime(date) != null) {
                                                    Navigator.of(context).push(
                                                      showPicker(
                                                        minHour: officeTime(date),
                                                        maxHour: 21.0,
                                                        minuteInterval: MinuteInterval.THIRTY,
                                                        context: context,
                                                        accentColor: highLcolorLight,
                                                        blurredBackground: true,
                                                        onChange: (timeOfDay) {
                                                          time = timeOfDay.format(this.context).toString();
                                                        },
                                                        value: TimeOfDay(
                                                          hour: officeTime(date).toInt(),
                                                          minute: 00,
                                                        ),
                                                        disableHour: false,
                                                        disableMinute: false,
                                                        iosStylePicker: kIsWeb ? false : true,
                                                        displayHeader: true,
                                                        is24HrFormat: true,
                                                        dialogInsetPadding:
                                                            EdgeInsets.symmetric(horizontal: isMobile(screenSize) ? 40.0 : 300.0, vertical: 24.0),
                                                        themeData: ThemeData.dark().copyWith(
                                                            colorScheme:
                                                                ColorScheme.fromSwatch().copyWith(secondary: highLcolorLight, primary: Colors.white)),
                                                        onSubmit: () {
                                                          getItCart.setTime(time);
                                                          getItCart.setLatlong(widget.lat, widget.long);
                                                          getItCart.setLocation(widget.name);
                                                          print(widget.pin);
                                                          getItCart.setPin(widget.pin);
                                                          context.router.pushNamed('/service');
                                                        },
                                                      ),
                                                    );
                                                  } else {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) => AlertDialog(
                                                              title: Text('Please select a different date'),
                                                            ));
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                        } else {
                          context.router.pushNamed('/LoginPage');
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle chooseAddMain() => TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle chooseAddValue() => TextStyle(
        color: Colors.white,
      );
}
