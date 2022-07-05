import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Anu/LoginPage.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Customers.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TextFieldWidget.dart';
import 'package:elie_web/Utils/TextFieldWidget_BottomLine.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Utils/CustomTextFormFieldColumnOverlay.dart';
import 'Footer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String id = '/RegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController anniversaryController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  var btController = RoundedLoadingButtonController();

  var dateStr;
  var date;
  var anniversary;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    anniversaryController.dispose();
    phoneController.dispose();
    bloodController.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Color(0xff141414),
        body: Center(
          child: Column(
            children: [
              TopBar(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 600.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: Responsive.responsiveNumber(
                              10.0, 300.0, screenSize),
                          vertical: Responsive.responsiveNumber(
                              10.0, 100.0, screenSize)),
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 5.0, right: 30.0, left: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: highLcolorLight),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Registration',
                              style: TextStyle(
                                  color: Color(0xffFFA075),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  letterSpacing: 2.0,
                                  fontFamily: 'PT'),
                            ),
                            SizedBox(
                              height: 55.0,
                            ),
                            TextFieldWidgetBottomLine(
                              controller: nameController,
                              textColor: Colors.white,
                              inputType: TextInputType.name,
                              labelText: 'Name',
                              enableBorderColor: highLcolorDark,
                              focusBorderColor: highLcolorDark,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFieldWidgetBottomLine(
                              controller: emailController,
                              textColor: Colors.white,
                              inputType: TextInputType.emailAddress,
                              labelText: 'Email',
                              enableBorderColor: highLcolorDark,
                              focusBorderColor: highLcolorDark,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFieldWidgetBottomLine(
                              controller: dobController,
                              mandatory: false,
                              textColor: Colors.white,
                              inputType: TextInputType.datetime,
                              labelText: 'Your Birth Date',
                              hintText: 'Click to pick a date',
                              enableBorderColor: Color(0xffFFA075),
                              focusBorderColor: Color(0xffFFA075),
                              onPress: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Color(0xff141414),
                                    title: Text(
                                      'Choose Your Birth Date',
                                      style: TextStyle(
                                        color: highLcolor,
                                        fontSize: 20.0,
                                        fontFamily: 'NT',
                                      ),
                                    ),
                                    content: Container(
                                      height: screenSize.height / 2.0,
                                      width: 400.0,
                                      child: SfDateRangePicker(
                                        selectionTextStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white70),
                                        selectionColor: highLcolor,
                                        selectionRadius: 90.0,
                                        selectionShape:
                                            DateRangePickerSelectionShape
                                                .rectangle,
                                        headerHeight: 100.0,
                                        headerStyle: DateRangePickerHeaderStyle(
                                            textAlign: TextAlign.center),
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
                                        backgroundColor: Colors.black,
                                        allowViewNavigation: true,
                                        onSelectionChanged: (value) {
                                          date = value.value;
                                          dateStr = DateFormat('dd, MMMM yyyy')
                                              .format(value.value)
                                              .toString();
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
                                              style: OutlinedButton.styleFrom(
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
                                                        .responsiveNumber(4.0,
                                                            40.0, screenSize),
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
                                                        .responsiveNumber(4.0,
                                                            40.0, screenSize),
                                                    vertical: 10.0),
                                                child: Text(
                                                  'Confirm',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      fontFamily: 'NT'),
                                                ),
                                              ),
                                              onPressed: () {
                                                dobController.text = dateStr;
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            // TextFieldWidgetBottomLine(
                            //   controller: anniversaryController,
                            //   textColor: Colors.white,
                            //   inputType: TextInputType.none,
                            //   labelText: 'Anniversary',
                            //   hintText: 'Click to pick a date',
                            //   mandatory: false,
                            //   enableBorderColor: Color(0xffFFA075),
                            //   focusBorderColor: Color(0xffFFA075),
                            //   onPress: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (context) => AlertDialog(
                            //         backgroundColor: Color(0xff141414),
                            //         title: Text(
                            //           'Choose Your Anniversary Date',
                            //           style: TextStyle(
                            //             color: highLcolor,
                            //             fontSize: 20.0,
                            //             fontFamily: 'NT',
                            //           ),
                            //         ),
                            //         content: Container(
                            //           height: screenSize.height / 2.0,
                            //           width: 400.0,
                            //           child: SfDateRangePicker(
                            //             selectionTextStyle: TextStyle(fontSize: 15.0, color: Colors.white70),
                            //             selectionColor: highLcolor,
                            //             selectionRadius: 90.0,
                            //             selectionShape: DateRangePickerSelectionShape.rectangle,
                            //             headerHeight: 100.0,
                            //             headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
                            //             showNavigationArrow: true,
                            //             monthCellStyle: DateRangePickerMonthCellStyle(
                            //               textStyle: TextStyle(fontFamily: "tex", color: Colors.white, fontSize: 16.0),
                            //               disabledDatesTextStyle: TextStyle(fontStyle: FontStyle.normal, color: Colors.white54),
                            //             ),
                            //             backgroundColor: Colors.black,
                            //             allowViewNavigation: true,
                            //             onSelectionChanged: (value) {
                            //               anniversary = value.value;
                            //               dateStr = DateFormat('dd, MMMM yyyy').format(value.value).toString();
                            //             },
                            //           ),
                            //         ),
                            //         actions: [
                            //           Row(
                            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Expanded(
                            //                 child: OutlinedButton(
                            //                   style: OutlinedButton.styleFrom(
                            //                     backgroundColor: Color(0xff141414),
                            //                     side: BorderSide(
                            //                       color: highLcolor,
                            //                       width: 1.0,
                            //                     ),
                            //                     primary: highLcolor,
                            //                   ),
                            //                   child: Padding(
                            //                     padding: EdgeInsets.symmetric(horizontal: Responsive.responsiveNumber(4.0, 40.0, screenSize), vertical: 10.0),
                            //                     child: Text(
                            //                       'Cancel',
                            //                       style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'NT'),
                            //                     ),
                            //                   ),
                            //                   onPressed: () {
                            //                     Navigator.of(context).pop();
                            //                   },
                            //                 ),
                            //               ),
                            //               Expanded(
                            //                 child: OutlinedButton(
                            //                   style: OutlinedButton.styleFrom(
                            //                     backgroundColor: Color(0xff141414),
                            //                     side: BorderSide(
                            //                       color: highLcolor,
                            //                       width: 1.0,
                            //                     ),
                            //                     primary: highLcolor,
                            //                   ),
                            //                   child: Padding(
                            //                     padding: EdgeInsets.symmetric(horizontal: Responsive.responsiveNumber(4.0, 40.0, screenSize), vertical: 10.0),
                            //                     child: Text(
                            //                       'Confirm',
                            //                       style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'NT'),
                            //                     ),
                            //                   ),
                            //                   onPressed: () {
                            //                     anniversaryController.text = dateStr;
                            //                     Navigator.pop(context);
                            //                   },
                            //                 ),
                            //               ),
                            //             ],
                            //           )
                            //         ],
                            //       ),
                            //     );
                            //   },
                            // ),

                            // CustomTextFormFieldColumnOverlay(
                            //   maxLine: 1,
                            //   controller: bloodController,
                            //   title: 'Blood Group',
                            //   items: ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-'],
                            //   onTap: (v) {
                            //     bloodController.text = v;
                            //   },
                            // ),

                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: highLcolor,
                                      width: 1,
                                    ),
                                    primary: highLcolor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    child: Text(
                                      'REGISTER',
                                      style: TextStyle(
                                          color: Color(0xffFFA075),
                                          fontSize: 15,
                                          fontFamily: 'NT'),
                                    ),
                                  ),
                                  onPressed: () async {
                                    phoneController = TextEditingController();
                                    otpController = TextEditingController();
                                    if (formKey.currentState!.validate()) {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) => Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Responsive
                                                        .responsiveNumber(20.0,
                                                            300.0, screenSize),
                                                    vertical: 20),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Confirmation',
                                                          style: TextStyle(
                                                              letterSpacing:
                                                                  2.0,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 25.0,
                                                              fontFamily: 'PT'),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Please enter your phone number',
                                                              style: TextStyle(
                                                                  letterSpacing:
                                                                      2.0,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      13.0,
                                                                  fontFamily:
                                                                      'NT'),
                                                            ),
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      TextFieldWidget(
                                                                    inputType:
                                                                        TextInputType
                                                                            .phone,
                                                                    controller:
                                                                        phoneController,
                                                                    hintText:
                                                                        "xxxxx-xxxxx",
                                                                    labelText:
                                                                        "Phone Number",
                                                                    fill: true,
                                                                    fillColor:
                                                                        Color(
                                                                            0xff707070),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5.0,
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        53.0,
                                                                    width: 53.0,
                                                                    child:
                                                                        OutlinedButton(
                                                                      style: OutlinedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Color(0xff141414),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              highLcolor,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        primary:
                                                                            highLcolor,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        otpController.text =
                                                                            '';
                                                                        Customers?
                                                                            ref =
                                                                            await API().getCustomerByPhone(int.parse(phoneController.text));
                                                                        print(
                                                                            ref);
                                                                        if (ref !=
                                                                            null) {
                                                                          showTopSnackBar(
                                                                            context,
                                                                            CustomSnackBar.error(
                                                                              backgroundColor: highLcolorDark,
                                                                              message: "Your Phone No. Is Already Registered",
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          await Dio()
                                                                              .post('$baseUrl/generate_otp/${phoneController.text}');
                                                                          showTopSnackBar(
                                                                            context,
                                                                            CustomSnackBar.success(
                                                                              backgroundColor: highLcolor,
                                                                              message: "We have sent your OTP at ${phoneController.text}",
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(3.0),
                                                                        child:
                                                                            Text(
                                                                          'Get OTP',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              letterSpacing: 2.0,
                                                                              color: Colors.white,
                                                                              fontSize: 15.0,
                                                                              fontFamily: 'NT'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                              'Enter OTP',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  letterSpacing:
                                                                      2.0,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      13.0,
                                                                  fontFamily:
                                                                      'NT'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 400.0,
                                                            child:
                                                                PinCodeTextField(
                                                              length: 6,
                                                              obscureText:
                                                                  false,
                                                              controller:
                                                                  otpController,
                                                              animationType:
                                                                  AnimationType
                                                                      .scale,
                                                              pinTheme: PinTheme(
                                                                  shape: PinCodeFieldShape
                                                                      .circle,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          5.0),
                                                                  fieldHeight:
                                                                      50.0,
                                                                  fieldWidth:
                                                                      40.0,
                                                                  activeFillColor:
                                                                      highLcolor,
                                                                  selectedFillColor: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.4),
                                                                  selectedColor: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.3),
                                                                  activeColor: Color.fromRGBO(
                                                                      208,
                                                                      85,
                                                                      85,
                                                                      0.5799999833106995),
                                                                  inactiveColor:
                                                                      Color.fromRGBO(
                                                                          208,
                                                                          85,
                                                                          85,
                                                                          0.5799999833106995),
                                                                  inactiveFillColor:
                                                                      Colors.white
                                                                          .withOpacity(0.0)),
                                                              animationDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          300),
                                                              enableActiveFill:
                                                                  true,
                                                              onCompleted:
                                                                  (v) {},
                                                              beforeTextPaste:
                                                                  (text) {
                                                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                                                return false;
                                                              },
                                                              onChanged: (String
                                                                  value) {},
                                                              appContext:
                                                                  context,
                                                            ),
                                                          ),
                                                          RoundedLoadingButton(
                                                            resetAfterDuration:
                                                                true,
                                                            resetDuration:
                                                                Duration(
                                                                    seconds:
                                                                        20),
                                                            borderRadius: 12.0,
                                                            color: highLcolor,
                                                            width: 70,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: Responsive
                                                                    .responsiveNumber(
                                                                        9.0,
                                                                        40.0,
                                                                        screenSize),
                                                                vertical: 10.0,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'Register',
                                                                  style: TextStyle(
                                                                      letterSpacing:
                                                                          2.0,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: Responsive.responsiveNumber(
                                                                          16.0,
                                                                          19.0,
                                                                          screenSize),
                                                                      fontFamily:
                                                                          'NT'),
                                                                ),
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              btController
                                                                  .start();
                                                              ///////////////////AT HOME-GETTING LOCATION///////////////////AT HOME-GETTING LOCATION///////////////////AT HOME-GETTING LOCATION///////////////////AT HOME GETTING LOCATION
                                                              try {
                                                                print('start');
                                                                print(
                                                                    otpController
                                                                        .text);
                                                                var otpVer =
                                                                    (await Dio()
                                                                            .get(
                                                                  '$baseUrl/verify_customer/${phoneController.text}',
                                                                  queryParameters: {
                                                                    "otp":
                                                                        otpController
                                                                            .text
                                                                  },
                                                                ))
                                                                        .data;
                                                                print(otpVer);

                                                                if (otpVer) {
                                                                  var parsedJson = Customers(
                                                                          nameController
                                                                              .text,
                                                                          '',
                                                                          phoneController
                                                                              .text,
                                                                          emailController
                                                                              .text,
                                                                          passwordController
                                                                              .text,
                                                                          DateTime.now()
                                                                              .toString(),
                                                                          date != null
                                                                              ? DateTime.now().year -
                                                                                  date
                                                                                      .year
                                                                              : 0,
                                                                          date != null
                                                                              ? date
                                                                                  .toString()
                                                                              : DateTime.now()
                                                                                  .toString(),
                                                                          anniversary
                                                                              .toString(),
                                                                          DateTime.now()
                                                                              .toString(),
                                                                          0,
                                                                          0,
                                                                          bloodController
                                                                              .text,
                                                                          phoneController
                                                                              .text)
                                                                      .toJson();

                                                                  print(jsonEncode(
                                                                      parsedJson));
                                                                  saveAndRedirectToHome(
                                                                      parsedJson);
                                                                } else {
                                                                  btController
                                                                      .error();
                                                                  Timer(
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                      () {
                                                                    btController
                                                                        .reset();
                                                                  });
                                                                  showTopSnackBar(
                                                                    context,
                                                                    CustomSnackBar
                                                                        .error(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      message:
                                                                          "Please Enter Correct OTP",
                                                                    ),
                                                                  );
                                                                }
                                                              } catch (e, s) {
                                                                print(e);
                                                                print(s);
                                                                btController
                                                                    .error();
                                                                Timer(
                                                                    Duration(
                                                                        seconds:
                                                                            2),
                                                                    () {
                                                                  btController
                                                                      .reset();
                                                                });
                                                                showTopSnackBar(
                                                                  context,
                                                                  CustomSnackBar
                                                                      .error(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    message:
                                                                        "Please Enter Correct OTP",
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            controller:
                                                                btController,
                                                          ),
                                                          SizedBox(
                                                            height: 25.0,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            TextButton(
                              onPressed: () {
                                getItPages
                                    .setCurrentPathANDTopColorOFF(LoginPage.id);
                                context.router.pushNamed('/LoginPage');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Already a member? Click here',
                                  style: TextStyle(
                                      color: highLcolorDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'PT'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    isMobile(screenSize) ? Container() : Footer()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void saveAndRedirectToHome(parsedJson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('working');
    print(phoneController.text);
    int userPhone = int.parse(phoneController.text);

    prefs.setInt("userPhone", userPhone);
    prefs.setString("userPass", passwordController.text);
    prefs.setString("userName", nameController.text);
    prefs.setString("userEmail", emailController.text);
    getItUserIn.setUserIn(prefs.get("userPhone"), prefs.get("userPass"),
        prefs.get("userName"), prefs.get('userEmail'));

    await API().addCustomer(parsedJson);
    Timer(Duration(milliseconds: 1000), () {
      btController.success();

      Timer(Duration(milliseconds: 800), () {
        if (getItCart.productData != null) {
          context.router
              .pushNamed('/ProductDescPage/${getItCart.productData!.id}');
        } else if (getItCart.serviceData != null) {
          print(getItCart.serviceData?.id);
          context.router
              .pushNamed('/ServiceDescPage/${getItCart.serviceData!.id}');
        } else {
          context.router.pushNamed('/');
        }
        btController.reset();
      });
    });
    setState(() {});
  }
}
