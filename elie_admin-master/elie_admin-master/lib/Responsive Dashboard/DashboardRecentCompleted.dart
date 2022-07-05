import 'package:data_table_2/data_table_2.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

class DashboardRecentCompleted extends StatefulWidget {
  DashboardRecentCompleted({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardRecentCompleted> createState() => _DashboardRecentCompletedState();
}

class _DashboardRecentCompletedState extends State<DashboardRecentCompleted> {
  List orderCompleteList = [];
  bool loading = true;

  getOrders() async {
    List<Order> order = await API().getOrder();

    var tot = 0.0;
    for (var item in order) {
      if (item.status == 'Completed') {
        Customers? customer = await API().getCustomerByPhone(item.id);

        if (item.serviceId != null) {
          tot = (await API().getServiceByID(item.serviceId)).saleCost ?? 0.0;
        } else if (item.productId != null) {
          tot = (await API().getProductsByID(item.productId)).salePrice;
        }

        orderCompleteList.add([item, tot, customer]);
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recently Completed",
            style: TextStyle(fontSize: 25),
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    scrollController: ScrollController(),
                    columnSpacing: 8.0,
                    minWidth: 600,
                    columns: [
                      DataColumn(
                        label: Text("Order No."),
                      ),
                      DataColumn(
                        label: Text("Customer"),
                      ),
                      DataColumn(
                        label: Text("Date"),
                      ),
                      DataColumn(
                        label: Text("Time"),
                      ),
                      DataColumn(
                        label: Text("Status"),
                      ),
                      DataColumn(
                        label: Text("Amount"),
                      ),
                    ],
                    rows: List.generate(
                      orderCompleteList.length,
                      (index) => recentFileDataRow(
                        orderCompleteList[index][0],
                        orderCompleteList[index][1],
                        orderCompleteList[index][2],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Order order, tot, Customers customer) {
  var dateTime = new DateFormat("y-M-d H:m:s").parse(order.completeDate);
  var time = DateFormat.Hms().format(dateTime);
  var date = DateFormat.yMd().format(dateTime);

  return DataRow(
    cells: [
      DataCell(Text(order.orderId.toString())),
      DataCell(Text(customer.name.toString())),
      DataCell(Text(date.toString())),
      DataCell(Text(time.toString())),
      DataCell(Text(
        order.status.toString(),
        style: TextStyle(color: Colors.greenAccent),
      )),
      DataCell(Text((101.1 * order.quantity).toString())),
    ],
  );
}
