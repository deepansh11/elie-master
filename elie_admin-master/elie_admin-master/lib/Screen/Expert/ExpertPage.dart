import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Expert/AvailabilityPage.dart';
import 'package:elie_admin/Screen/Widgets/ActionButtons.dart';
import 'package:flutter/material.dart';

import '../../Utils/Constants.dart';

class ExpertPage extends StatefulWidget {
  const ExpertPage();

  @override
  State<ExpertPage> createState() => _ExpertPageState();
}

class _ExpertPageState extends State<ExpertPage> {
  late List expertsList = [];
  var loading = true;

  getExperts() async {
    expertsList = [];
    List<Experts> experts = await API().getExperts();

    for (var item in experts) {
      expertsList.add(item);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getExperts();
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
                  'Experts',
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
                            scrollController:
                                ScrollController(keepScrollOffset: true),
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
                                label: _TextHeadingCell(title: "Status"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Tips"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Commisions"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Availability"),
                              ),
                              DataColumn(
                                label: _TextHeadingCell(title: "Actions"),
                              ),
                            ],
                            rows: List.generate(expertsList.length, (index) {
                              return BuildDataRow(expertsList[index]);
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
              getItAdminCurrentPage.setIndex(13);
            },
            child: Text('Add Expert'),
          ),
        )
      ],
    );
  }

  DataRow BuildDataRow(Experts experts) {
    return DataRow(
      cells: [
        DataCell(
          _TextCell(
            title: experts.name,
          ),
        ),
        DataCell(_TextCell(
          title: experts.phone,
        )),
        DataCell(_TextCell(
          title: experts.email,
        )),
        DataCell(_TextCell(
          title: experts.age,
        )),
        DataCell(_TextCell(
          title: experts.status,
        )),
        DataCell(_TextCell(
          title: experts.totalTips,
        )),
        DataCell(_TextCell(
          title: experts.totalCommission,
        )),
        DataCell(TextButton(
          onPressed: () async {
            Navigator.push(
                (context),
                MaterialPageRoute(
                  builder: (context) => Theme(
                    data: ThemeData(brightness: Brightness.light),
                    child: AvailabilityPage(
                      phone: experts.phone,
                    ),
                  ),
                ));
          },
          child: Text('View'),
        )),
        DataCell(
          ActionButtons(
            func: getExperts,
            index: 7,
            item: 'e',
            id: experts.phone,
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
