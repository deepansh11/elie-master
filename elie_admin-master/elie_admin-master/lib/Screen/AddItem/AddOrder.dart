import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Database/Tracking.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/CustomFormFields.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Widgets/CustomTextFormFieldColumnOverlay.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddOrder extends StatefulWidget {
  AddOrder({Key? key, this.title}) : super(key: key);
  final title;

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController phone = TextEditingController();

  TextEditingController date = TextEditingController();
  TextEditingController serviceName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController expertName = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController paid = TextEditingController();
  TextEditingController paymentForm = TextEditingController();

  var loadingBtn = false;

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
            selectionTextStyle: TextStyle(fontSize: 15.0, color: Colors.white70),
            selectionColor: primaryColor,
            selectionRadius: 90.0,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            headerHeight: 100.0,
            headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
            showNavigationArrow: true,
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(fontFamily: "tex", color: Colors.white, fontSize: 16.0),
              disabledDatesTextStyle: TextStyle(fontStyle: FontStyle.normal, color: Colors.white54),
            ),
            backgroundColor: Colors.black,
            allowViewNavigation: true,
            onSelectionChanged: (value) {
              cont.text = DateFormat('dd/MM/yyyy').format(value.value).toString();
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'tex'),
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'tex'),
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

  customerTimePicker({screenSize, title, cont}) async {
    var t = await showDialog(
      context: context,
      builder: (context) => TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );

    var d = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, t.hour, t.minute);

    time.text = DateFormat('hh:mm a').format(d).toString();
    print(time.text);
  } //timePicker

  List<List<dynamic>> listExpert = [];
  List<List<dynamic>> listService = [];
  bool loading = true;

  getExpertService(t) async {
    listService = [];
    listExpert = [];

    listExpert = (await API().getExperts()).map((e) => [e.name, e.phone]).toList();
    listService = (await API().getServices()).map((e) => [e.name, e.id]).toList();

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExpertService(DateTime.now());
    date.text = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  }

  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return loading
        ? Center(child: CircularProgressIndicator())
        : Form(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Add ${widget.title} Orderr',
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
                                  controller: phone,
                                  title: "Customer's Phone Number",
                                  maxLine: 1,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: CustomTextFormFieldColumnOverlay(
                                  maxLine: 1,
                                  controller: serviceName,
                                  title: 'Choose Service',
                                  height: 170,
                                  items: listService,
                                  onTap: (var v, var i) async {
                                    serviceName.text = v;
                                    serviceID = i;

                                    amount.text = (await API().getServiceByID(serviceID)).saleCost.toString();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormFieldColumn(
                                  controller: date,
                                  title: 'Date',
                                  maxLine: 1,
                                  onTap: () => customerDatePicker(
                                    title: 'Date',
                                    cont: date,
                                    screenSize: screenSize,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: CustomTextFormFieldColumn(
                                  controller: time,
                                  title: 'Time',
                                  maxLine: 1,
                                  onTap: () async {
                                    var c = await customerTimePicker(
                                      title: 'Time',
                                      cont: time,
                                      screenSize: screenSize,
                                    );
                                    print(date.text + 'T' + time.text);
                                    getExpertService(null);
                                    return c;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormFieldColumnOverlay(
                                  maxLine: 1,
                                  controller: expertName,
                                  title: 'Choose Expert',
                                  height: 250,
                                  items: listExpert,
                                  onTap: (v, i) {
                                    expertName.text = v;
                                    expertID = i;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: CustomTextFormFieldColumn(
                                  controller: amount,
                                  title: 'Amount',
                                  maxLine: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormFieldColumnOverlay(
                                  maxLine: 1,
                                  controller: paid,
                                  title: 'Pay Status',
                                  height: 100,
                                  items: ['Paid', 'Not Paid'],
                                  onTap: (v) {
                                    paid.text = v;
                                    print('kk');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: CustomTextFormFieldColumnOverlay(
                                  maxLine: 1,
                                  controller: paymentForm,
                                  title: 'Form of Payment',
                                  height: 100,
                                  items: ['Online', 'At Store'],
                                  onTap: (v) {
                                    paymentForm.text = v;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: CustomTextFormFieldColumnOverlay(
                                  maxLine: 1,
                                  controller: location,
                                  title: 'Location',
                                  height: 170,
                                  items: ['Ritz Carlton Pune', 'Panchshil Towers', 'Uno Training School', 'Training Centre'],
                                  onTap: (v) {
                                    location.text = v;
                                  },
                                ),
                              )
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
                              getItAdminCurrentPage.setIndex(3);
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
                                    setState(() {
                                      loadingBtn = true;
                                    });

                                    try {
                                      Customers? ref = await API().getCustomerByPhone(int.parse(phone.text));
                                      if (ref == null) {
                                        showTopSnackBar(
                                          context,
                                          CustomSnackBar.error(
                                            backgroundColor: Colors.red,
                                            message: "Customer Phone Number Is Not Registered",
                                          ),
                                        );
                                      } else {
                                        var id = await API().addOrder(Order(
                                                int.parse(phone.text),
                                                (await API().getOrder()).length + 1,
                                                null,
                                                serviceID,
                                                location.text,
                                                date.text,
                                                time.text,
                                                expertID,
                                                double.parse(amount.text),
                                                'Order Received',
                                                paymentForm.text,
                                                paid.text == 'Paid' ? true : false,
                                                1,
                                                '')
                                            .toJson());

                                        var s = await API().getServiceByID(serviceID);
                                        var startTimee = DateFormat('dd/MM/yyyyThh:mm a').parse(date.text + 'T' + time.text);
                                        var endTimee = startTimee.add(Duration(minutes: s.duration));
                                        var startTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(startTimee);
                                        var endTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(endTimee);
                                        print(id);
                                        await Dio().post("$baseURL/add_booking", data: {
                                          "orderId": id.data['orderId'],
                                          "expertId": expertID,
                                          "startTime": startTime,
                                          "endTime": endTime,
                                        });

                                        Timer(Duration(seconds: 1), () {
                                          setState(() {
                                            loadingBtn = false;
                                          });
                                          getItAdminCurrentPage.setIndex(3);
                                        });
                                      }
                                    } catch (e) {
                                      Timer(Duration(seconds: 1), () {
                                        setState(() {
                                          loadingBtn = false;
                                        });
                                        print(e);
                                      });
                                    }
                                    imageCache.clear();
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
