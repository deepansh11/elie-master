import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/CustomFormFields.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Widgets/CustomTextFormFieldColumnOverlay2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddCoupon extends StatefulWidget {
  @override
  State<AddCoupon> createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController couponCode = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController validity = TextEditingController();
  bool loadingBtn = false;

  var availability = true;
  var image;
  var serviceID;
  var expertID;

  customerDatePicker({screenSize, title, cont}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xff141414),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'tex',
          ),
        ),
        content: Container(
          height: screenSize.height / 2.0,
          width: 400.0,
          child: SfDateRangePicker(
            selectionTextStyle:
                TextStyle(fontSize: 15.0, color: Colors.white70),
            selectionColor: primaryColor,
            selectionRadius: 90.0,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            headerHeight: 100.0,
            headerStyle:
                DateRangePickerHeaderStyle(textAlign: TextAlign.center),
            showNavigationArrow: true,
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(
                  fontFamily: "tex", color: Colors.white, fontSize: 16.0),
              disabledDatesTextStyle:
                  TextStyle(fontStyle: FontStyle.normal, color: Colors.white54),
            ),
            backgroundColor: Colors.black,
            allowViewNavigation: true,
            onSelectionChanged: (value) {
              cont.text =
                  DateFormat('dd/MM/yyyy').format(value.value).toString();
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
                      color: primaryColor,
                      width: 1.0,
                    ),
                    primary: primaryColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'tex'),
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
                      color: primaryColor,
                      width: 1.0,
                    ),
                    primary: primaryColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'tex'),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  } //datePicker

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Form(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add Coupon',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  key: _formKey,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFieldColumn(
                            controller: couponCode,
                            title: "Coupon Code",
                            maxLine: 1,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: CustomTextFormFieldColumn(
                            maxLine: 1,
                            controller: discount,
                            title: 'Discount Percentage (in %)',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFieldColumnOverlay(
                            maxLine: 1,
                            controller: type,
                            title: 'Coupon Type',
                            height: 100,
                            items: ['One Time', 'Multiple'],
                            onTap: (v) {
                              type.text = v;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: CustomTextFormFieldColumn(
                            controller: validity,
                            title: 'Validity Till',
                            maxLine: 1,
                            onTap: () => customerDatePicker(
                              title: 'Date',
                              cont: validity,
                              screenSize: screenSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 190,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        getItAdminCurrentPage.setIndex(2);
                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff7188b7),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: loadingBtn
                          ? () {}
                          : () async {
                              //clearing

                              if (couponCode.text.isEmpty ||
                                  type.text.isEmpty ||
                                  discount.text.isEmpty ||
                                  validity.text.isEmpty) {
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.error(
                                    backgroundColor: Colors.red,
                                    message: "Please enter all the fields",
                                  ),
                                );
                                setState(() {
                                  loadingBtn = false;
                                });
                              } else {
                                setState(() {
                                  loadingBtn = true;
                                });

                                await Dio()
                                    .post("$baseURL/create_coupon", data: {
                                  "couponId": couponCode.text,
                                  "discount": int.parse(discount.text),
                                  "isOnetime":
                                      type.text == 'One Time' ? true : false,
                                  "validTill": DateFormat('dd/MM/yyyy')
                                      .parse(validity.text)
                                      .toString(),
                                });
                                Timer(Duration(seconds: 1), () {
                                  getItAdminCurrentPage.setIndex(9);
                                  couponCode.clear();
                                  validity.clear();
                                  discount.clear();
                                  type.clear();
                                  setState(() {
                                    loadingBtn = false;
                                  });
                                });
                              }
                            },
                      child: loadingBtn
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text('Add'),
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class CheckBoxListTileWidget extends StatefulWidget {
  CheckBoxListTileWidget({
    Key? key,
    required this.func,
  }) : super(key: key);

  final Function func;

  @override
  State<CheckBoxListTileWidget> createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: Colors.white,
      activeColor: primaryColor,
      tileColor: secondaryColor,
      title: Text('Available'),
      value: checked,
      onChanged: (value) {
        setState(() {
          checked = value!;
          widget.func(checked);
        });
      },
    );
  }
}
