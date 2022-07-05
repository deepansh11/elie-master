import 'dart:js';

import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Database/API.dart';

import 'package:elie_admin/Database/Product.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Utils/OverlayStatus.dart';

import 'package:flutter/material.dart';

class ProductOrderDetail extends StatefulWidget {
  const ProductOrderDetail();

  @override
  State<ProductOrderDetail> createState() => _ProductOrderDetailState();
}

class _ProductOrderDetailState extends State<ProductOrderDetail> {
  late List<List> orderList = [];
  var loading = true;

  getOrders() async {
    List order = (await Dio().get('$baseURL/getOrder')).data;

    for (var item in order) {
      Customers? customer = await API().getCustomerByPhone(item['id']);

      if (item['productId'] != null) {
        var p = await API().getProductsByID(item['productId']);
        if (p.id != 0) {
          orderList.add([item, p, customer]);
        }
      }
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loading
              ? Padding(
                  padding: const EdgeInsets.only(top: 89.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: DataTable2(
                      scrollController:
                          ScrollController(keepScrollOffset: true),
                      bottomMargin: 200,
                      columnSpacing: 8.0,
                      minWidth: 2000,
                      columns: [
                        DataColumn(
                          label: _TextHeadingCell(title: "Order ID"),
                        ),
                        DataColumn(
                          label: _TextHeadingCell(title: "Product"),
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
                          label: _TextHeadingCell(title: "Quantity"),
                        ),
                        DataColumn(
                          label: _TextHeadingCell(title: "Amount"),
                        ),
                        DataColumn(
                          label: _TextHeadingCell(title: "Payment"),
                        ),
                        DataColumn(
                          label: _TextHeadingCell(title: "Mode"),
                        ),
                        DataColumn(
                          label: _TextHeadingCell(title: "Order Status"),
                        ),
                      ],
                      rows: List.generate(orderList.length, (index) {
                        print(orderList.length);

                        return BuildDataRow(orderList[index][0],
                            orderList[index][1], orderList[index][2], context);
                      }),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

DataRow BuildDataRow(var order, Product product, Customers customer, context) {
  var screenSize = MediaQuery.of(context).size;
  print('-------------------------------------');
  print(product.id);
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
                        '$baseURL/getProductImageByID/${product.id}',
                        fit: BoxFit.cover,
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
                          product.productTitle,
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Customer: ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Phone: ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Amount: ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Payment: ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              customer.name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              order['location'],
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              customer.phone.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              (double.parse(order['totAmount']
                                                          .toString()) +
                                                      100.0)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              order['paid'].toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'inter',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              order['paymentForm'].toString(),
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
                  child: Text(order['orderId']),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Text(order['date']),
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
            title: order['orderId'],
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: product.productTitle,
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: customer.name,
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: order['location'],
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: order['date'],
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: order['quantity'],
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: (double.parse(order['totAmount'].toString()) + 100.0)
                    .toString() *
                order['quantity'],
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: order['paid'] == false ? 'Not Done' : "Done",
          ),
          onTap: cellTap),
      DataCell(
          _TextCell(
            title: order['paymentForm'],
          ),
          onTap: cellTap),
      DataCell(OverlayStatus(order['status'], order['orderId'])),
    ],
  );
}

class _TextCell extends StatelessWidget {
  const _TextCell({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title.toString().replaceAll("\n", " "),
        style:
            TextStyle(color: Colors.white, fontFamily: 'inter', fontSize: 16),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _TextHeadingCell extends StatelessWidget {
  const _TextHeadingCell({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title.toString(),
        style:
            TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'inter'),
      ),
    );
  }
}
