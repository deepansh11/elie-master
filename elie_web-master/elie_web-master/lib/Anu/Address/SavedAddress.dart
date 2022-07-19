import 'dart:math';
import 'package:intl/intl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elie_web/Anu/Address/NewAddress.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Database/Locator.dart';
import '../../DateNightTime/lib/constants.dart';
import '../../DateNightTime/lib/daynight_timepicker.dart';
import '../../Services/GetLocation.dart';
import '../../Utils/Constants.dart';

class SavedAddress extends StatefulWidget {
  SavedAddress(this.prefs, this.screenSize, this.expert);
  final prefs;
  final screenSize;
  final expert;
  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  List<Widget> addressList = [];
  bool loading = true;
  //variables
  var locResponse;
  var date;
  var time = '';

  savedAddress(prefs, screenSize) async {
    addressList = [];
    addressList.add(Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      decoration: BoxDecoration(
                        gradient: kGradiantBackground,
                      ),
                      child: NewAddress(expert: widget.expert),
                      width: screenSize.width,
                    ),
                  ));
        },
        child: DottedBorder(
          child: Container(
            height: 400,
            width: 400,
            child: Center(
              child: Text(
                'Add New Address',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffebab8b),
                  letterSpacing: 1,
                  fontFamily: 'NT',
                ),
              ),
            ),
          ),
          borderType: BorderType.RRect,
          color: Color(0xffebab8b),
          radius: Radius.circular(5),
          dashPattern: [10, 5, 10, 5, 10, 5],
        ),
      ),
    ));

    var address = await Dio()
        .get("$baseUrl/get_customer_addresses/${prefs.get("userPhone")}");

    List cardList = address.data;
    for (var e in cardList) {
      addressList.add(Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () async {
            var latitude;
            var longitude;

            // if (kIsWeb) {
            //
            //   locResponse = await getLocationData();
            //   getItCart.setLatlong(locResponse['lat'], locResponse['lon']);
            // } else {
            //
            //   await determinePosition().then((value) {
            //     latitude = value.latitude;
            //     longitude = value.longitude;
            //   });
            //
            //   getItCart.setLatlong(latitude, longitude);
            // }
            getItCart.setLatlong(0, 0);
            getItCart.setLocation(
                '''${getItUserIn.userName}
${e['address1']}, 
${e['address2']}
${e['city']}, ${e['state']} - ${e['pincode']}''');

            getItCart.setPin(e['pincode']);

            if (widget.expert) {
              if (getItCart.productData != null) {
                await getItCart.addToCart(false);
              }

              showDialog(
                  context: this.context,
                  builder: (context) => AlertDialog(
                        backgroundColor: Color(0xff141414),
                        title: Text(
                          'Choose your Date for home service',
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
                            selectionTextStyle: TextStyle(
                                fontSize: 15.0, color: Colors.white70),
                            selectionColor: highLcolor,
                            todayHighlightColor: highLcolorDark,
                            selectionRadius: 90.0,
                            selectionShape:
                                DateRangePickerSelectionShape.rectangle,
                            headerHeight: 100.0,
                            headerStyle: DateRangePickerHeaderStyle(
                                textAlign: TextAlign.center),
                            showNavigationArrow: true,
                            monthCellStyle: DateRangePickerMonthCellStyle(
                              textStyle: TextStyle(
                                  fontFamily: "tex",
                                  color: Colors.white,
                                  fontSize: 16.0),
                              disabledDatesTextStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white54),
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
                                        horizontal: Responsive.responsiveNumber(
                                            4.0, 40.0, screenSize),
                                        vertical: 10.0),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontFamily: 'NT'),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            isMobile(screenSize) ? 2.0 : 40.0,
                                        vertical: 10.0),
                                    child: Text(
                                      'Choose your time',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontFamily: 'NT'),
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
                                      getItCart.setDate(DateFormat('dd/MM/yyyy')
                                          .format(date)
                                          .toString());

                                      Navigator.of(context).push(
                                        showPicker(
                                          minHour: officeTime(date),
                                          maxHour: 21.0,
                                          minuteInterval: MinuteInterval.THIRTY,
                                          context: context,
                                          accentColor: highLcolorLight,
                                          blurredBackground: true,
                                          onChange: (timeOfDay) {
                                            time = timeOfDay
                                                .format(this.context)
                                                .toString();
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
                                              EdgeInsets.symmetric(
                                                  horizontal:
                                                      isMobile(screenSize)
                                                          ? 40.0
                                                          : 300.0,
                                                  vertical: 24.0),
                                          themeData: ThemeData.dark().copyWith(
                                              colorScheme:
                                                  ColorScheme.fromSwatch()
                                                      .copyWith(
                                                          secondary:
                                                              highLcolorLight,
                                                          primary:
                                                              Colors.white)),
                                          onSubmit: () {
                                            getItCart.setTime(time);

                                            context.router
                                                .pushNamed('/service');
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
            } else {
              if (getItCart.productData != null) {
                await getItCart.addToCart(true);
              }
              Navigator.pop(context);
              context.router.pushNamed('/cart');
            }
          },
          style: ButtonStyle(
            foregroundColor: getColor(Colors.white, Colors.black),
            backgroundColor: getColor(Color(0xffebab8b).withOpacity(0.1),
                Color(0xffebab8b).withOpacity(1)),
            side: getBorder(Color(0xffebab8b), Color(0xffbd7853)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.home,
                          size: Responsive.responsiveNumber(
                              18.0, 25.0, screenSize),
                        ),
                        SizedBox(
                          width: Responsive.responsiveNumber(
                              5.0, 10.0, screenSize),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: Responsive.responsiveNumber(
                                18.0, 25.0, screenSize),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'NT',
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: Responsive.responsiveNumber(2.0, 15.0, screenSize),
                ),
                Text(
                  '''${getItUserIn.userName}
${e['address1']}, 
${e['address2']}
${e['city']}, ${e['state']} - ${e['pincode']} ''',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    height: Responsive.responsiveNumber(1.0, 2.0, screenSize),
                    fontFamily: 'NT',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'Mobile : 9867452803',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      height: 2,
                      fontFamily: 'NT',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Responsive.responsiveNumber(20.0, 40.0, screenSize)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          await Dio().delete(
                              '$baseUrl/delete_address_id/${e['addressId']}');
                          savedAddress(prefs, screenSize);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                size: 20,
                              ),
                              SizedBox(
                                width: Responsive.responsiveNumber(
                                    5.0, 10.0, screenSize),
                              ),
                              Text(
                                'Remove',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontFamily: 'NT',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width:
                            Responsive.responsiveNumber(20.0, 40.0, screenSize),
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Icon(
                      //       Icons.edit,
                      //       size: 20,
                      //     ),
                      //     SizedBox(
                      //       width: Responsive.responsiveNumber(5.0, 10.0, screenSize),
                      //     ),
                      //     Text(
                      //       'Edit',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         letterSpacing: 1,
                      //         fontFamily: 'NT',
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    savedAddress(widget.prefs, widget.screenSize);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return loading
        ? Center(
            child: CircularProgressIndicator(
              color: highLcolor,
            ),
          )
        : GridView.count(
            childAspectRatio:
                Responsive.responsiveNumber(1.0, 1.45, screenSize),
            crossAxisCount: Responsive.responsiveNumber(1, 2, screenSize),
            children: addressList,
          );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}

MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPressed) {
  final getBorder = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return BorderSide(color: colorPressed, width: 2);
    } else {
      return BorderSide(color: color, width: 2);
    }
  };
  return MaterialStateProperty.resolveWith(getBorder);
}
