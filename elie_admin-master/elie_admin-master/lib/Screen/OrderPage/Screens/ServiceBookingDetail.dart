import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'dart:js' as js;
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Database/Product.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Utils/OverlayExpert.dart';
import 'package:elie_admin/Utils/OverlayStatus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../Database/Expert.dart';
import '../../../Responsive Dashboard/constants.dart';

class ServiceBookingDetail extends StatefulWidget {
  const ServiceBookingDetail();

  @override
  State<ServiceBookingDetail> createState() => _ServiceBookingDetailState();
}

class _ServiceBookingDetailState extends State<ServiceBookingDetail> {
  late ValueNotifier<List> orderList = ValueNotifier([]);
  late List expertsList = [];

  var loading = true;

  getOrders() async {
    orderList.value = [];
    loading = true;
    List<Order> order = await API().getOrder();

    if (order.isNotEmpty) {
      for (var item in order) {
        Customers? customer = await API().getCustomerByPhone(item.id);

        if (item.productId == null) {
          var p = await API().getServiceByID(item.serviceId);
          if (p.id != 0) {
            if (item.expertId.toString() != 'null') {
              Experts? expert = await API().getExpertsByID(item.expertId);
              orderList.value.add([item, p, customer, expert]);
            } else {
              orderList.value.add([item, p, customer, null]);
            }
          }
        }
      }
      getExperts();

      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  getExperts() async {
    expertsList = [];
    List<Experts> experts = await API().getExperts();

    for (Experts item in experts) {
      expertsList.add(item);
    }
  }

  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  customerDatePicker({screenSize, expertId, cont1, cont2, order}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xff141414),
        title: Text(
          expertId.toString(),
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
              cont1.text =
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
                    onPressed: () async {
                      Navigator.pop(context);
                      await customerTimePicker(
                          screenSize: screenSize,
                          expertId: expertId,
                          cont: cont2,
                          order: order);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  } //datePicker

  customerTimePicker({screenSize, expertId, cont, order}) async {
    var t = await showDialog(
      context: context,
      builder: (context) => TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );

    var d = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, t.hour, t.minute);

    time.text = DateFormat('hh:mm a').format(d).toString();
    print(time.text);
    var dd = DateFormat('dd/MM/yyyy').parse(date.text);
    var ddd = DateFormat('hh:mm a').parse(time.text);
    var dddd = dd.add(Duration(days: 0, hours: ddd.hour, minutes: ddd.minute));
    print(dddd);

    print(DateFormat('dd/MM/yyyy hh:mm a')
        .parse(DateFormat('yyyy/MM/dd hh:mm a').format(dddd))
        .toString());
    await Dio().post('$baseURL/update_date/$order',
        queryParameters: {'date': dddd.toString()});
    getOrders();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    orderList.dispose();
  }

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Service Booking',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              if (loading)
                Padding(
                  padding: const EdgeInsets.only(top: 89.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
              else
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: orderList,
                        builder: (context, List value, child) {
                          return DataTable2(
                            bottomMargin: 300,
                            columnSpacing: 8.0,
                            minWidth: 2000,
                            columns: [
                              DataColumn(
                                label: _TextHeadingCell(title: "Order ID"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Service"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Customer"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Address"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Date"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Expert"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Amount"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Payment"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Order Status"),
                              ),
                            ],
                            rows: List.generate(value.length, (index) {
                              return BuildDataRow(
                                  value[index][0],
                                  value[index][1],
                                  value[index][2],
                                  value[index][3],
                                  context);
                            }),
                          );
                        }),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  getItAdminCurrentPage.setIndex(19);
                },
                child: Text('Add Service Order'),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await Dio().post('$baseURL/export_excel_all');
                  js.context.callMethod('open', ['$baseURL/get_all_excel/']);
                },
                child: Text('Excel Report'),
              ),
            ],
          ),
        )
      ],
    );
  }

  DataRow BuildDataRow(Order order, Services service, Customers customer,
      Experts? expert, context) {
    var screenSize = MediaQuery.of(context).size;

    cellTap() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Stack(
                children: [
                  Container(
                    height: screenSize.height / 1.2,
                    width: screenSize.width / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          '$baseURL/getServiceImageByID/${service.id}',
                          height: 250,
                          width: 250,
                          errorBuilder: (c, a, s) {
                            print(a);
                            return Container(
                              height: 30,
                              width: 30,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            service.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Card(
                                      color: bgColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Customer: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Address: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                              width: 70,
                                              child: Divider(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Phone: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Email: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                              width: 70,
                                              child: Divider(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Amount: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Payment: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Mode: ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                customer.name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                order.location
                                                    .replaceAll("\n", " "),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                customer.phone.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                customer.email.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                order.totAmount.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                order.paid == true
                                                    ? 'Paid'
                                                    : 'Not Paid',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                order.paymentForm.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'inter',
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Text(order.orderId),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Text(order.date),
                  )
                ],
              ),
            );
          });
    }

    return DataRow(
      cells: [
        DataCell(
            _TextCell(
              title: order.orderId,
            ),
            onTap: cellTap),
        DataCell(
            _TextCell(
              title: service.name,
            ),
            onTap: cellTap),
        DataCell(
            _TextCell(
              title: customer.name,
            ),
            onTap: cellTap),
        DataCell(
            _TextCell(
              title: order.location,
            ),
            onTap: cellTap),
        DataCell(
            _TextCell(
              title: order.date + ' ' + order.time,
              color: primaryColor,
            ),
            onTap: () => customerDatePicker(
                cont1: date,
                cont2: time,
                expertId: order.expertId,
                screenSize: screenSize,
                order: order.orderId)),
        expert != null
            ? DataCell(OverlayExpert(expert, order.orderId, expertsList))
            : DataCell(OverlayExpert(
                Experts('Not Assigned', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                order.orderId,
                expertsList)),
        DataCell(
            _TextCell(
              title: order.totAmount * order.quantity,
            ),
            onTap: cellTap),
        DataCell(
            _TextCell(
              title: order.paid == false ? 'Not Done' : "Done",
            ),
            onTap: cellTap),
        DataCell(OverlayStatus(order.status, order.orderId)),
      ],
    );
  }
}

class _TextCell extends StatelessWidget {
  _TextCell({
    Key? key,
    this.title,
    this.color = Colors.white,
  }) : super(key: key);

  final title;
  var color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title.toString().replaceAll("\n", " "),
        style: TextStyle(color: color, fontFamily: 'inter', fontSize: 16),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class _TextHeadingCell extends StatelessWidget {
  _TextHeadingCell({
    Key? key,
    this.title,
    this.color = Colors.white,
  }) : super(key: key);

  final title;
  var color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title.toString(),
        style: TextStyle(color: color, fontFamily: 'inter', fontSize: 16),
      ),
    );
  }
}
