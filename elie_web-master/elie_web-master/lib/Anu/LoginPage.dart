import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Anu/RegisterPage.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Customers.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TextFieldWidget_BottomLine.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'Footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = '/LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  var btController = RoundedLoadingButtonController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
    otpController.dispose();
  }

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
                      height: 450.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: Responsive.responsiveNumber(
                              10.0, 300.0, screenSize),
                          vertical: Responsive.responsiveNumber(
                              20.0, 100.0, screenSize)),
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 5.0, right: 30.0, left: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: highLcolorLight),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xffFFA075),
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              letterSpacing: 1.0,
                              fontFamily: 'NT',
                            ),
                          ),
                          SizedBox(
                            height: 55.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidgetBottomLine(
                                  controller: phoneController,
                                  textColor: Color(0xffFFA075),
                                  inputType: TextInputType.phone,
                                  labelText: 'Phone Number',
                                  enableBorderColor: highLcolorDark,
                                  focusBorderColor: highLcolorDark,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xff141414),
                                    side: BorderSide(
                                      color: highLcolor,
                                      width: 2.0,
                                    ),
                                    primary: highLcolor,
                                  ),
                                  onPressed: () async {
                                    Customers? ref = await API()
                                        .getCustomerByPhone(
                                            int.parse(phoneController.text));
                                    if (ref == null) {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.error(
                                          backgroundColor: Colors.red,
                                          message:
                                              "Your Phone No. Is Not Registered",
                                        ),
                                      );
                                    } else {
                                      await Dio().post(
                                          '$baseUrl/generate_otp/${phoneController.text}');
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.success(
                                          backgroundColor: highLcolor,
                                          message:
                                              "We have sent your OTP at ${phoneController.text}",
                                        ),
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      'Get OTP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontFamily: 'NT'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFieldWidgetBottomLine(
                            controller: otpController,
                            textColor: Color(0xffFFA075),
                            inputType: TextInputType.number,
                            labelText: 'OTP',
                            enableBorderColor: highLcolorDark,
                            focusBorderColor: highLcolorDark,
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedLoadingButton(
                                borderRadius: 12.0,
                                color: highLcolor,
                                width: 90,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Responsive.responsiveNumber(
                                        9.0, 40.0, screenSize),
                                    vertical: 10.0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Responsive.responsiveNumber(
                                              14.0, 15.0, screenSize),
                                          fontFamily: 'NT'),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  btController.start();
                                  try {
                                    var otpVer = (await Dio().get(
                                            '$baseUrl/verify_customer/${phoneController.text}',
                                            queryParameters: {
                                          "otp": otpController.text
                                        }))
                                        .data;

                                    if (otpVer) {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      int userPhone =
                                          int.parse(phoneController.text);

                                      var user = await API()
                                          .getCustomerByPhone(userPhone);

                                      if (user != null) {
                                        prefs.setInt("userPhone", userPhone);
                                        prefs.setString(
                                            "userPass", otpController.text);
                                        prefs.setString("userName", user.name);
                                        prefs.setString(
                                            "userEmail", user.email);
                                        getItUserIn.setUserIn(
                                            prefs.get("userPhone"),
                                            prefs.get("userPass"),
                                            prefs.get("userName"),
                                            prefs.get('userEmail'));
                                        Timer(Duration(milliseconds: 1000), () {
                                          btController.success();

                                          Timer(Duration(milliseconds: 800),
                                              () {
                                            if (getItCart.productData != null) {
                                              context.router.replaceNamed(
                                                  '/ProductDescPage/${getItCart.productData!.id}');
                                            } else if (getItCart.isSpa ==
                                                false) {
                                              context.router.replaceNamed(
                                                  '/LocationPage');
                                            } else if (getItCart.isSpa ==
                                                true) {
                                              context.router.replaceNamed(
                                                  '/LocationPage');
                                            } else if (getItCart.isPackage ==
                                                true) {
                                              context.router.replaceNamed(
                                                  '/LocationPage');
                                            } else {
                                              context.router.replaceNamed('/');
                                            }
                                            btController.reset();
                                          });
                                        });

                                        print(prefs.get("userName"));
                                      } else {
                                        Timer(Duration(milliseconds: 500), () {
                                          btController.error();
                                          Timer(Duration(milliseconds: 500),
                                              () {
                                            btController.reset();
                                          });
                                        });

                                        showTopSnackBar(
                                          context,
                                          CustomSnackBar.error(
                                            backgroundColor: Colors.red,
                                            message:
                                                "Please Register Your Number",
                                          ),
                                        );
                                      }
                                    } else {
                                      Timer(Duration(milliseconds: 500), () {
                                        btController.error();
                                        Timer(Duration(milliseconds: 500), () {
                                          btController.reset();
                                        });
                                      });

                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.error(
                                          backgroundColor: Colors.red,
                                          message: "Please Enter Correct OTP",
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    Timer(Duration(milliseconds: 500), () {
                                      btController.error();
                                      Timer(Duration(milliseconds: 1000), () {
                                        btController.reset();
                                      });
                                    });
                                    print(e);
                                    showTopSnackBar(
                                      context,
                                      CustomSnackBar.error(
                                        backgroundColor: Colors.red,
                                        message: "Something went wrong",
                                      ),
                                    );
                                  }
                                },
                                controller: btController,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: highLcolor,
                                    width: 1.0,
                                  ),
                                  primary: highLcolor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 15.0),
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(
                                        color: highLcolorDark,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        fontFamily: 'NT',
                                        letterSpacing: 1),
                                  ),
                                ),
                                onPressed: () {
                                  getItPages.setCurrentPathANDTopColorOFF(
                                      RegisterPage.id);
                                  context.router.pushNamed('/RegisterPage');
                                },
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 50.0,
                          // ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: Text(
                          //     'Forgot Password? Click here',
                          //     style: TextStyle(
                          //         color: highLcolorDark, fontWeight: FontWeight.bold, fontSize: 14.0, letterSpacing: 1, fontFamily: 'NT'),
                          //   ),
                          // )
                        ],
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
}
