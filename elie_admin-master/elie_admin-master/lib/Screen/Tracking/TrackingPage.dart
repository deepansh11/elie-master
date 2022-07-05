import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Tracking/MapWidget.dart';
import 'package:elie_admin/Screen/Tracking/TrackingExpertCard.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TrackingPage extends StatefulWidget {
  TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  Experts? expert;
  var selected = 0;
  List orderList = [];
  var dateTime;
  var loading = true;
  List<Widget> expertList = [];
  var map;
  var i = 0;
  getExpert() async {
    var data = await API().getExperts();
    expertList = [];
    var i = 0;
    for (Experts d in data) {
      expertList.add(
        TrackingExpertCard(
          expert: d,
          selected: getSelected,
          index: i,
          isSelected: i == selected ? true : false,
        ),
      );

      i++;
      setState(() {
        loading = false;
      });
    }
  }

  getSelected(index, Experts e) async {
    loading = true;
    expert = e;
    selected = index;
    print(selected);
    await getOrderOfExpert();
    getExpert();
    map = MapWidget(
      expert: e,
      dateTime: dateTime,
    );
    setState(() {
      loading = false;
    });
  }

  getOrderOfExpert() async {
    orderList = [];
    var order =
        (await Dio().get('$baseURL/get_bookings_expertId/${expert!.phone}'))
            .data;
    List d = (await Dio().get('$baseURL/total_tracking/${expert!.phone}')).data;
    dateTime = DateFormat('yyyy-MM-ddThh:mm').parse(d.last['timeStamp']);
    print(dateTime);

    for (var d in order) {
      orderList.add(d);
    }
  }

  @override
  void initState() {
    super.initState();
    getExpert();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return loading
        ? Center(child: CircularProgressIndicator())
        : Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(4),
                        child: expert == null
                            ? Text(
                                "Select an expert",
                                style: TextStyle(fontSize: 30),
                              )
                            : Column(
                                children: [
                                  map,
                                  // ?? expert.last_location
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Experts',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              DatePicker.showDateTimePicker(
                                                  context,
                                                  onConfirm: (value) {
                                                    dateTime = value;
                                                    Timer(
                                                        Duration(
                                                            milliseconds: 100),
                                                        () {
                                                      getItTrackingPageLocator
                                                          .setSelected(1);
                                                      Timer(
                                                          Duration(
                                                              milliseconds: 50),
                                                          () {
                                                        setState(() {});
                                                      });
                                                    });
                                                  },
                                                  currentTime: dateTime,
                                                  onCancel: () {
                                                    Navigator.pop(context);
                                                  });
                                            },
                                            child: Text('Select Date')),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                    Expanded(
                      child: Container(
                        child: GridView.count(
                          controller: ScrollController(keepScrollOffset: true),
                          childAspectRatio: 1 / 1.5,
                          crossAxisCount: 3,
                          children: expertList,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Upcoming Orders',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenSize.width / 5,
                      height: screenSize.height / 1.2,
                      child: ListView.builder(
                        itemCount: orderList.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(64, 75, 96, .9)),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  leading: Container(
                                    padding: EdgeInsets.only(right: 12.0),
                                    decoration: new BoxDecoration(
                                        border: new Border(
                                            right: new BorderSide(
                                                width: 1.0,
                                                color: Colors.white24))),
                                    child: Icon(Icons.spa_outlined,
                                        color: Colors.white),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Order ID: ${orderList[index]['orderId']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(
                                          "At ${DateFormat('hh:mm').format(DateFormat('yyyy-MM-ddThh:mm:ss').parse(orderList[index]['startTime'])).toString()} on ${DateFormat('dd/MM/yyyy').format(DateFormat('yyyy-MM-ddThh:mm:ss').parse(orderList[index]['startTime'])).toString()}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
