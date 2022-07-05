import 'package:data_table_2/data_table_2.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/ActionButtons.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage();

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends VisibilityAwareState<ServicesPage> {
  late List servicesList = [];
  var loading = true;

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    // TODO: Use visibility
    super.onVisibilityChanged(visibility);
    print(visibility);
    if (visibility == WidgetVisibility.VISIBLE) {
      getServices();
    } else {
      dispose();
    }
  }

  getServices() async {
    servicesList = [];
    List<Services> services = await API().getServices();

    for (var item in services) {
      servicesList.add(item);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Service',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
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
                      child: DataTable2(
                        scrollController: ScrollController(keepScrollOffset: true),
                        bottomMargin: 100,
                        minWidth: 1500,
                        columnSpacing: 8.0,
                        columns: [
                          DataColumn(
                            label: _TextHeadingCell(title: "ID"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Product"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Product Description"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Salon Price"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Home Price"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Tax"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Type"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Status"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Actions"),
                          ),
                        ],
                        rows: List.generate(servicesList.length, (index) {
                          return BuildDataRow(servicesList[index]);
                        }),
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
              getItAdminCurrentPage.setIndex(12);
            },
            child: Text('Add Service'),
          ),
        ),
      ],
    );
  }

  DataRow BuildDataRow(Services services) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Image.network(
                '$baseURL/getServiceImageByID/${services.id}',
                height: 30,
                width: 30,
                errorBuilder: (c, a, s) {
                  print(a);
                  return Container(
                    height: 30,
                    width: 30,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _TextCell(
                  title: services.id,
                ),
              ),
            ],
          ),
        ),
        DataCell(_TextCell(
          title: services.name,
        )),
        DataCell(_TextCell(
          title: services.desc,
        )),
        DataCell(_TextCell(
          title: services.saleCost,
        )),
        DataCell(_TextCell(
          title: services.cost ?? '0',
        )),
        DataCell(_TextCell(
          title: services.tax,
        )),
        DataCell(_TextCell(
          title: services.isSpa == true ? 'Spa' : 'Salon',
        )),
        DataCell(_TextCell(
          title: services.status ? 'Active' : 'Inactive',
        )),
        DataCell(
          ActionButtons(
            func: getServices,
            index: 5,
            item: 's',
            id: services.id,
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
