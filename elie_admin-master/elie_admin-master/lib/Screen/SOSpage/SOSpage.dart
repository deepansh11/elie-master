import 'dart:math';

import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Tracking/MapWidget.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SOSpage extends StatefulWidget {
  SOSpage({Key? key}) : super(key: key);

  @override
  State<SOSpage> createState() => _SOSpageState();
}

class _SOSpageState extends State<SOSpage> {
  Experts? expert;
  var selected;
  List<Card> sosList = [];
  List cards = [];
  bool loading = true;
  var time;

  getSelected(index, Experts e, t) {
    expert = e;
    selected = index;
    time = t;

    getItTrackingPageLocator.setSelected(selected);
    setState(() {
      loading = false;
    });
  }

  getSOS() async {
    sosList = [];
    Response response = await Dio().get('$baseURL/get_all_sos');
    if (response.statusCode == 200) {
      List sos = await response.data;
      var i = -1;
      for (var e in sos) {
        var date = DateFormat('dd/MM/yyyy')
            .format(DateFormat('yyyy-MM-ddThh:mm:ss').parse(e['date_time']));
        var time = DateFormat('hh:mm')
            .format(DateFormat('yyyy-MM-ddThh:mm:ss').parse(e['date_time']));

        var expert = await API().getExpertsByID(e['orderId']);
        if (expert != null) {
          i++;

          sosList.add(Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: Icon(Icons.badge_outlined, color: Colors.white),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e['sosMessage'].toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.report_rounded, color: Colors.redAccent),
                      SizedBox(
                        width: 5,
                      ),
                      Text("At ${time.toString()} on ${date.toString()}",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  onTap: () {
                    getSelected(i, expert,
                        DateFormat('yyyy-MM-ddThh:mm').parse(e['date_time']));
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.task_alt_outlined,
                        color: Colors.white, size: 30.0),
                    onPressed: () {},
                  ),
                )),
          ));
        }
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSOS();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            width: 500,
            height: screenSize.height / 1.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Emergency Alerts',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : ListView(
                            children: sosList,
                          ),
                  ),
                ],
              ),
            )),
        Expanded(
            child: expert != null
                ? MapWidget(
                    expert: expert!,
                    heightO: screenSize.height,
                    dateTime: time,
                  )
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.all(98.0),
                    child: Text(
                      'Select SOS to get current location on map',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40),
                    ),
                  )))
      ],
    );
  }
}
