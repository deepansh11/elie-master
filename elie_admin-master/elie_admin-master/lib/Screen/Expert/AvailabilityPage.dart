import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dio/dio.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time_range/time_range.dart';
import '../../Database/API.dart';
import '../../Database/Order.dart';
import '../../Database/Service.dart';

class AvailabilityPage extends StatefulWidget {
  AvailabilityPage({Key? key, this.phone}) : super(key: key);
  final phone;

  @override
  State<AvailabilityPage> createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  DateTime selectedDate = DateTime.now();
  DateTime fromTime = DateTime.now();
  DateTime toTime = DateTime.now();
  var loading = true;

  List<Appointment> meetings = [];

  getData() async {
    meetings = [];

    print(widget.phone);
    var booking;
    var orders = await OrderPageModel(widget.phone).getOrderByExpert();

    for (var order in orders) {
      Services service;
      if (order['id'] != 0) {
        service = await API().getServiceByID(order['serviceId']);
        var dateTime = DateFormat("dd/MM/yyyy hh:mm a")
            .parse(order['date'] + " " + order['time']);

        print(service.id);
        meetings.add(Appointment(
            startTime: dateTime,
            endTime: dateTime.add(Duration(minutes: service.duration)),
            color: primaryColor,
            subject: 'Booking',
            id: service.id,
            notes: order['orderId'].toString()));
      } else {
        booking =
            await Dio().get('$baseURL/get_bookings_expertId/${widget.phone}');
      }
    }
    if (booking != null) {
      for (var d in booking.data) {
        meetings.add(Appointment(
            startTime: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(d['startTime']),
            endTime: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(d['endTime']),
            color: Colors.redAccent,
            subject: 'Leave',
            id: d['bookingId'],
            notes: "Not Available"));
      }
    }
    loading = false;
    print(meetings);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new))),
      body: Container(
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: SfCalendar(
                      backgroundColor: whiteSmoke,
                      todayHighlightColor: primaryColor,
                      view: CalendarView.week,
                      onTap: (value) async {
                        if (value.appointments![0].notes != 'Not Available') {
                          Services service = value.appointments![0].id =
                              await API()
                                  .getServiceByID(value.appointments![0].id);
                          // Order order = (await Dio().get('http://$baseURL/getOrderByOrderId/${value.appointments![0].notes}')).data;

                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                    child: Container(
                                      color: whiteSmoke,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Booking Detail',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            Card(
                                              child: Container(
                                                height: 100,
                                                color: whiteSmoke,
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Image.network(
                                                            "$baseURL/getServiceImageByID/${service.id}"),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              flex: 5,
                                                              child: ListTile(
                                                                title: Text(
                                                                    service
                                                                        .name),
                                                                subtitle: Text(
                                                                    "At ${DateFormat("hh:mm a").format(value.appointments![0]?.startTime)}"),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      flex: 8,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              elevation: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        } else {
                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                    child: Container(
                                      color: whiteSmoke,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Leave Detail',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            Card(
                                              child: Container(
                                                height: 200,
                                                color: whiteSmoke,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      18.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'From',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    DateFormat().format(value
                                                                        .appointments![
                                                                            0]
                                                                        .startTime),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  Text(
                                                                    'To',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    DateFormat().format(value
                                                                        .appointments![
                                                                            0]
                                                                        .endTime),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 5,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  TextButton(
                                                                    child: Text(
                                                                        "Cancel Leave"),
                                                                    onPressed:
                                                                        () async {
                                                                      await Dio()
                                                                          .delete(
                                                                              '$baseURL/delete_booking_bookingId/${value.appointments![0].id}');
                                                                      Navigator.pop(
                                                                          context);
                                                                      getData();
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      flex: 8,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              elevation: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        }
                      },
                      initialDisplayDate: DateTime.now(),
                      firstDayOfWeek: 1,
                      timeSlotViewSettings: TimeSlotViewSettings(
                        startHour: 8,
                        endHour: 22,
                      ),
                      dataSource: MeetingDataSource(meetings),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {
                                  availabilityBottomSelector(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Color(0xff0F0F0F),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    border: Border.all(
                                      color: primaryColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Select Off Time',
                                      style: TextStyle(
                                          fontSize: 16, color: whiteSmoke),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              getData();
                            },
                            icon: Icon(
                              Icons.refresh_outlined,
                              color: whiteSmoke,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<dynamic> availabilityBottomSelector(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select when expert will be unavailable',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: whiteSmoke,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TimeRange(
                fromTitle: Text(
                  'From',
                  style: TextStyle(fontSize: 18, color: Color(0xff141414)),
                ),
                toTitle: Text(
                  'To',
                  style: TextStyle(fontSize: 18, color: Color(0xff141414)),
                ),
                titlePadding: 20,
                textStyle: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black87),
                activeTextStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: whiteSmoke),
                borderColor: primaryColor,
                backgroundColor: Colors.transparent,
                activeBackgroundColor: Colors.black,
                activeBorderColor: primaryColor,
                firstTime: TimeOfDay(hour: 08, minute: 00),
                lastTime: TimeOfDay(hour: 22, minute: 00),
                timeStep: 30,
                timeBlock: 30,
                onRangeCompleted: (range) => setState(() {
                  var t = range!.start;
                  var e = range.end;
                  var now = selectedDate;
                  fromTime =
                      DateTime(now.year, now.month, now.day, t.hour, t.minute);
                  toTime =
                      DateTime(now.year, now.month, now.day, e.hour, e.minute);
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/card_bg.png'),
                        fit: BoxFit.fill,
                      ),
                      color: Color(0xff0F0F0F),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    print(selectedDate);
                    print(fromTime);
                    await Dio().post("$baseURL/add_booking", data: {
                      "orderId": '000',
                      "expertId": widget.phone,
                      "startTime":
                          DateFormat('yyyy-MM-ddTHH:mm:ss').format(fromTime),
                      "endTime":
                          DateFormat('yyyy-MM-ddTHH:mm:ss').format(toTime),
                    });
                    selectedDate = DateTime.now();
                    fromTime = DateTime.now();
                    toTime = DateTime.now();
                    Navigator.pop(context);
                    getData();
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xff0F0F0F),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 16, color: whiteSmoke),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                  print(24 - TimeOfDay.now().hour);
                  await Dio().post("$baseURL/add_booking", data: {
                    "orderId": '000',
                    "expertId": widget.phone,
                    "startTime": DateFormat('yyyy-MM-ddTHH:mm:ss')
                        .format(selectedDate.add(Duration(
                      hours: 8,
                    ))),
                    "endTime": DateFormat('yyyy-MM-ddTHH:mm:ss').format(
                        selectedDate.add(Duration(hours: 23, minutes: 59))),
                  });
                  selectedDate = DateTime.now();
                  fromTime = DateTime.now();
                  toTime = DateTime.now();
                  Navigator.pop(context);
                  getData();
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/card_bg.png'),
                      fit: BoxFit.fill,
                    ),
                    color: Color(0xff0F0F0F),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: Center(
                    child: Text(
                      'Whole Day Off',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class OrderPageModel {
  OrderPageModel(this.phone);
  final phone;

  Future<List> getOrderByExpert() async {
    var booking = await Dio().get('$baseURL/get_bookings_expertId/${phone}');
    List orderList = [];
    for (var d in booking.data) {
      if (d['orderId'].toString() != '000' && d['isDone'] == false) {
        var order =
            (await Dio().get('$baseURL/getOrderByOrderId/${d['orderId']}'))
                .data;
        orderList.add(order);
      } else {
        orderList.add({
          'id': 0,
          'orderId': 000,
          'date': d['startTime'],
        });
      }
    }
    print(orderList);
    return orderList;
  }
}
