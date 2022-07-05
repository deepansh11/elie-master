import 'package:data_table_2/data_table_2.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Database/API.dart';

import 'package:elie_admin/Database/Product.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/ActionButtons.dart';
import 'package:elie_admin/Utils/OverlayStatus.dart';

import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage();

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late List customerList = [];
  var loading = true;

  getCustomer() async {
    customerList = [];
    List<Customers> customers = await API().getCustomer();

    for (var item in customers) {
      customerList.add(item);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getCustomer();
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
                  'Customers',
                  style: TextStyle(fontSize: 30),
                ),
              ),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DataTable2(
                            scrollController: ScrollController(keepScrollOffset: true),
                            bottomMargin: 10,
                            minWidth: 900,
                            columnSpacing: 8.0,
                            columns: [
                              DataColumn(
                                label: _TextHeadingCell(title: "Name"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Phone No."),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "E-mail"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Age"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Gender"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Actions"),
                              ),
                            ],
                            rows: List.generate(customerList.length, (index) {
                              return BuildDataRow(customerList[index]);
                            }),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              getItAdminCurrentPage.setIndex(14);
            },
            child: Text('Add Customer'),
          ),
        )
      ],
    );
  }

  DataRow BuildDataRow(Customers customer) {
    return DataRow(
      cells: [
        DataCell(
          _TextCell(
            title: customer.name,
          ),
        ),
        DataCell(_TextCell(
          title: customer.phone,
        )),
        DataCell(_TextCell(
          title: customer.email,
        )),
        DataCell(_TextCell(
          title: customer.age,
        )),
        DataCell(_TextCell(
          title: customer.sex == '' ? 'Not Defined' : customer.sex,
        )),
        DataCell(
          ActionButtons(
            func: getCustomer,
            index: 7,
            id: customer.phone,
            item: 'c',
          ),
        ),
      ],
    );
  }
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
        title.toString(),
        style: TextStyle(color: Colors.white, fontFamily: 'inter', fontSize: 16),
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
        style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'inter'),
      ),
    );
  }
}
