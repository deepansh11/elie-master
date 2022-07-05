import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

class CouponPage extends StatefulWidget {
  @override
  State<CouponPage> createState() => _CouponPageState();

  CouponPage({Key? key}) : super(key: key);
}

class _CouponPageState extends VisibilityAwareState<CouponPage> {
  late List couponList = [];
  var loading = true;

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    // TODO: Use visibility
    super.onVisibilityChanged(visibility);
    print(visibility);
    if (visibility == WidgetVisibility.VISIBLE) {
      getCoupon();
    } else {
      dispose();
    }
  }

  getCoupon() async {
    couponList = [];

    List coupon = (await Dio().get('$baseURL/get_all_coupon')).data;

    for (var item in coupon) {
      couponList.add(item);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
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
                  'Coupons',
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
                        child: DataTable2(
                          scrollController: ScrollController(keepScrollOffset: true),
                          columnSpacing: 8.0,
                          minWidth: 900,
                          columns: [
                            DataColumn(
                              label: _TextHeadingCell(title: "Coupon Code"),
                            ),
                            DataColumn(
                              label: _TextHeadingCell(title: "Discount"),
                            ),
                            DataColumn(
                              label: _TextHeadingCell(title: "Type"),
                            ),
                            DataColumn(
                              label: _TextHeadingCell(title: "Valid Till"),
                            ),
                            DataColumn(
                              label: _TextHeadingCell(title: "Actions"),
                            ),
                          ],
                          rows: List.generate(couponList.length, (index) {
                            return BuildDataRow(couponList[index]);
                          }),
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
              getItAdminCurrentPage.setIndex(20);
            },
            child: Text('Add Coupon'),
          ),
        )
      ],
    );
  }

  DataRow BuildDataRow(coupon) {
    return DataRow(
      cells: [
        DataCell(_TextCell(
          title: coupon['couponId'],
        )),
        DataCell(_TextCell(
          title: coupon['discount'],
        )),
        DataCell(_TextCell(
          title: coupon['isOnetime'] ? 'One Time' : 'Multiple',
        )),
        DataCell(_TextCell(
          title: DateFormat('dd, MMMM yyyy').format(DateFormat('yyyy-MM-ddThh:mm:ss').parse(coupon['validTill'])).toString(),
        )),
        DataCell(
          Container(
            // decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(4))),
            margin: EdgeInsets.all(2),
            child: IconButton(
              onPressed: () async {
                await Dio().delete('$baseURL/delete_coupon/${coupon['couponId']}');
                getCoupon();
              },
              icon: Icon(
                Icons.delete_outlined,
              ),
            ),
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
