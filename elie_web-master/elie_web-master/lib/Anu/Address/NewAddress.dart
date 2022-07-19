import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';
import '../../Database/Locator.dart';
import '../../DateNightTime/lib/constants.dart';
import '../../DateNightTime/lib/daynight_timepicker.dart';
import '../../Services/GetLocation.dart';

class NewAddress extends StatefulWidget {
  NewAddress({required this.expert});
  final expert;
  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  //CONTROLLERS
  TextEditingController cityTextFeild = TextEditingController();
  TextEditingController stateTextFeild = TextEditingController();
  TextEditingController landmarkTextFeild = TextEditingController();
  TextEditingController houseNumberTextFeild = TextEditingController();
  TextEditingController postalTextFeild = TextEditingController();

  //variables
  var locResponse;
  var date;
  var time = '';
  var getAddText = 'Get Current Address';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
          height: 600,
          width: screenSize.width / (isMobile(screenSize) ? 1 : 1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xfff5b595),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: isMobile(screenSize)
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Add  Shipping  Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffebab8b),
                        letterSpacing: 1,
                        fontFamily: 'NT',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: 740,
                    child: TextField(
                      controller: houseNumberTextFeild,
                      style: TextStyle(color: Color(0xffebab8b)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbd7853)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffebab8b)),
                        ),
                        labelText: 'Address',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffebab8b),
                          letterSpacing: 1,
                          fontFamily: 'NT',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 740,
                    child: TextField(
                      controller: landmarkTextFeild,
                      style: TextStyle(color: Color(0xffebab8b)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbd7853)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffebab8b)),
                        ),
                        labelText: 'Apartment, Suite, etc',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffebab8b),
                          letterSpacing: 1,
                          fontFamily: 'NT',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 740,
                    child: TextField(
                      controller: cityTextFeild,
                      style: TextStyle(color: Color(0xffebab8b)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbd7853)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffebab8b)),
                        ),
                        labelText: 'City',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffebab8b),
                          letterSpacing: 1,
                          fontFamily: 'NT',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 740,
                    child: TextField(
                      controller: stateTextFeild,
                      style: TextStyle(color: Color(0xffebab8b)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbd7853)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffebab8b)),
                        ),
                        labelText: 'State',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffebab8b),
                          letterSpacing: 1,
                          fontFamily: 'NT',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 740,
                    child: TextField(
                      controller: postalTextFeild,
                      style: TextStyle(color: Color(0xffebab8b)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbd7853)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffebab8b)),
                        ),
                        labelText: 'Pincode',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffebab8b),
                          letterSpacing: 1,
                          fontFamily: 'NT',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (houseNumberTextFeild.text.isEmpty ||
                              cityTextFeild.text.isEmpty ||
                              stateTextFeild.text.isEmpty ||
                              postalTextFeild.text.isEmpty) {
                            showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                backgroundColor: Colors.red,
                                message: "Please Enter correct address",
                              ),
                            );
                          } else {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await Dio().post('$baseUrl/add_address', data: {
                              "customerId":
                                  int.parse(prefs.get("userPhone").toString()),
                              "address1": houseNumberTextFeild.text,
                              "address2": landmarkTextFeild.text,
                              "city": cityTextFeild.text,
                              "state": stateTextFeild.text,
                              "pincode": double.parse(postalTextFeild.text),
                            });

                            getItCart.setLocation(houseNumberTextFeild.text +
                                landmarkTextFeild.text +
                                cityTextFeild.text +
                                stateTextFeild.text +
                                postalTextFeild.text);

                            getItCart.setPin(postalTextFeild.text);
                            if (widget.expert) {
                              if (getItCart.serviceData != null) {
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
                                                fontSize: 15.0,
                                                color: Colors.white70),
                                            selectionColor: highLcolor,
                                            todayHighlightColor: highLcolorDark,
                                            selectionRadius: 90.0,
                                            selectionShape:
                                                DateRangePickerSelectionShape
                                                    .rectangle,
                                            headerHeight: 100.0,
                                            headerStyle:
                                                DateRangePickerHeaderStyle(
                                                    textAlign:
                                                        TextAlign.center),
                                            showNavigationArrow: true,
                                            monthCellStyle:
                                                DateRangePickerMonthCellStyle(
                                              textStyle: TextStyle(
                                                  fontFamily: "tex",
                                                  color: Colors.white,
                                                  fontSize: 16.0),
                                              disabledDatesTextStyle: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white54),
                                            ),
                                            selectableDayPredicate:
                                                decideWhichDayToEnable,
                                            backgroundColor: Colors.black,
                                            allowViewNavigation: false,
                                            onSelectionChanged: (value) {
                                              this.date = value.value;
                                            },
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xff141414),
                                                    side: BorderSide(
                                                      color: highLcolor,
                                                      width: 1.0,
                                                    ),
                                                    primary: highLcolor,
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: Responsive
                                                            .responsiveNumber(
                                                                4.0,
                                                                40.0,
                                                                screenSize),
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
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xff141414),
                                                    side: BorderSide(
                                                      color: highLcolor,
                                                      width: 1.0,
                                                    ),
                                                    primary: highLcolor,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: isMobile(
                                                                    screenSize)
                                                                ? 2.0
                                                                : 40.0,
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
                                                          backgroundColor:
                                                              Colors.red,
                                                          message:
                                                              "Please Select a date",
                                                        ),
                                                      );
                                                    } else {
                                                      getItCart.setDate(
                                                          DateFormat(
                                                                  'dd/MM/yyyy')
                                                              .format(date)
                                                              .toString());

                                                      Navigator.of(context)
                                                          .push(
                                                        showPicker(
                                                          minHour:
                                                              officeTime(date),
                                                          maxHour: 21.0,
                                                          minuteInterval:
                                                              MinuteInterval
                                                                  .THIRTY,
                                                          context: context,
                                                          accentColor:
                                                              highLcolorLight,
                                                          blurredBackground:
                                                              true,
                                                          onChange:
                                                              (timeOfDay) {
                                                            time = timeOfDay
                                                                .format(this
                                                                    .context)
                                                                .toString();
                                                          },
                                                          value: TimeOfDay(
                                                            hour:
                                                                officeTime(date)
                                                                    .toInt(),
                                                            minute: 00,
                                                          ),
                                                          disableHour: false,
                                                          disableMinute: false,
                                                          iosStylePicker: kIsWeb
                                                              ? false
                                                              : true,
                                                          displayHeader: true,
                                                          is24HrFormat: true,
                                                          dialogInsetPadding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      isMobile(
                                                                              screenSize)
                                                                          ? 40.0
                                                                          : 300.0,
                                                                  vertical:
                                                                      24.0),
                                                          themeData: ThemeData.dark().copyWith(
                                                              colorScheme: ColorScheme
                                                                      .fromSwatch()
                                                                  .copyWith(
                                                                      secondary:
                                                                          highLcolorLight,
                                                                      primary:
                                                                          Colors
                                                                              .white)),
                                                          onSubmit: () {
                                                            getItCart
                                                                .setTime(time);

                                                            context.router
                                                                .pushNamed(
                                                                    '/service');
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
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: kGradiantButton,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      minWidth: 70,
                                      minHeight:
                                          40.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Continue  Shopping',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontFamily: 'NT',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var latitude;
                          var longitude;
                          setState(() {
                            getAddText = 'Loading...';
                          });
                          // if (kIsWeb) {
                          //
                          //   locResponse = await getLocationData();
                          //   getItCart.setLatlong(locResponse['lat'], locResponse['lon']);
                          //
                          //   setState(() {
                          //     cityTextFeild.text = locResponse['city'] == null ? '' : locResponse['city'].toString();
                          //     stateTextFeild.text =
                          //     locResponse['regionName'] == null ? '' : locResponse['regionName'].toString();
                          //     postalTextFeild.text = locResponse['zip'] == null ? '' : locResponse['zip'].toString();
                          //   });
                          // } else
                          try {
                            await determinePosition().then((value) {
                              latitude = value.latitude;
                              longitude = value.longitude;
                            });

                            var address = await placemarkFromCoordinates(
                                    latitude, longitude)
                                .onError((error, stackTrace) {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.info(
                                  backgroundColor: highLcolor,
                                  message:
                                      "Not able to determine your location",
                                ),
                              );
                              return [];
                            });
                            getItCart.setLatlong(latitude, longitude);

                            if (address != []) {
                              setState(() {
                                postalTextFeild.text =
                                    (address[0].postalCode == null
                                        ? ''
                                        : address[0].postalCode)!;
                                landmarkTextFeild.text =
                                    (address[0].subLocality == null
                                        ? ''
                                        : address[0].subLocality)!;
                                houseNumberTextFeild.text =
                                    (address[0].name == null
                                        ? ''
                                        : address[0].name)!;
                                cityTextFeild.text =
                                    (address[0].locality == null
                                        ? ''
                                        : address[0].locality)!;
                                stateTextFeild.text =
                                    (address[0].administrativeArea == null
                                        ? ''
                                        : address[0].administrativeArea)!;
                              });
                            }
                          } catch (e) {
                          } finally {
                            setState(() {
                              getAddText = 'Get Location Again';
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: highLcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      minWidth: 70,
                                      minHeight:
                                          40.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text(
                                    getAddText,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontFamily: 'NT',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
