import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Order.dart';
import 'package:elie_web/Database/Product.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../components/constants.dart';

class ProductOrderDetail extends StatefulWidget {
  const ProductOrderDetail();

  @override
  State<ProductOrderDetail> createState() => _ProductOrderDetailState();
}

class _ProductOrderDetailState extends State<ProductOrderDetail> {
  late List<List> orderList = [];

  var loading = true;
  getOrders() async {
    loading = true;
    orderList = [];
    List<Order> order = await API().getOrderById(getItUserIn.userPhone);
    for (var item in order) {
      if (item.productId != null) {
        var p = await API().getProductsByID(item.productId);
        if (p.id != 0) {
          List review = (await Dio().get(
                  '$baseUrl/get_order_reviewsByIdandOrderId/${item.id}',
                  queryParameters: {"orderId": item.orderId}))
              .data;
          orderList.add([item, p, review]);
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
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: highLcolorLight,
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    empty: Container(),
                    columnSpacing: defaultPadding,
                    minWidth: 1200,
                    columns: [
                      DataColumn(
                        label: TextHeadingCell(title: "Order ID"),
                      ),
                      DataColumn(
                        label: TextHeadingCell(title: "Product"),
                      ),
                      DataColumn(
                        label: TextHeadingCell(title: "Date"),
                      ),
                      DataColumn(
                        label: TextHeadingCell(title: "Product Cost"),
                      ),
                      DataColumn(
                        label: TextHeadingCell(title: "Quantity"),
                      ),
                      DataColumn(
                        label: TextHeadingCell(title: "Total Amount"),
                      ),
                      DataColumn(
                        label: TextHeadingCell(title: ""),
                      ),
                    ],
                    rows: List.generate(orderList.length, (index) {
                      return recentFileDataRow(orderList[index][0],
                          orderList[index][1], orderList[index][2]);
                    }),
                  ),
                ),
        ],
      ),
    );
  }

  DataRow recentFileDataRow(Order order, Product product, review) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Image.network(
                '$baseUrl/getProductImageByID/${product.id}',
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: TextCell(
                  title: order.orderId,
                ),
              ),
            ],
          ),
        ),
        DataCell(TextCell(
          title: product.productTitle,
        )),
        DataCell(TextCell(
          title: order.date,
        )),
        DataCell(TextCell(
          title: product.salePrice,
        )),
        DataCell(TextCell(
          title: order.quantity,
        )),
        DataCell(TextCell(
          title: order.totAmount,
        )),
        order.status != 'Order Received' && order.status != 'Canceled'
            ? DataCell(
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff141414),
                    side: BorderSide(
                      color: highLcolor,
                      width: 1,
                    ),
                    primary: highLcolor,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      review.isEmpty ? 'Review' : 'Edit Review',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'NT'),
                    ),
                  ),
                  onPressed: () async {
                    TextEditingController descCont = TextEditingController();
                    var rateDia = RatingDialog(
                      commentController: descCont,
                      initialRating: 1.0,
                      // your app's name?
                      title: Text(
                        'Rate your order',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // encourage your user to leave a high rating?
                      message: Text(
                        'order #${order.orderId}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: highLcolorLight),
                      ),
                      // logo
                      image: '$baseUrl/getProductImageByID/${product.id}',
                      submitButtonText: 'Submit',
                      submitButtonTextStyle:
                          TextStyle(color: highLcolor, fontSize: 18),
                      commentHint: 'Tell us about your experience',

                      onCancelled: () => print('cancelled'),
                      onSubmitted: (response) async {
                        print(
                            'rating: ${response.rating}, comment: ${response.comment}');

                        await Dio().post('$baseUrl/add_review/', data: {
                          "reviewId": order.id,
                          "orderId": order.orderId,
                          "rating": response.rating,
                          "reviewDesc": response.comment.toString()
                        });
                        getOrders();
                        setState(() {});
                        showTopSnackBar(
                          context,
                          CustomSnackBar.success(
                            backgroundColor: highLcolor,
                            message: "Thank you for your feedback",
                          ),
                        );
                      },
                    );
                    print(review);
                    if (review.isEmpty) {
                      showDialog(
                          context: context,
                          barrierDismissible:
                              true, // set to false if you want to force a rating
                          builder: (context) => rateDia);
                    } else {
                      TextEditingController descContt = TextEditingController();
                      descContt.text = review[0]['reviewDesc'] ?? "";
                      var ratingStar =
                          double.parse(review[0]['rating'].toString());
                      var rateDiaD = RatingDialog(
                        commentController: descContt,
                        initialRating: ratingStar,
                        // your app's name?
                        title: Text(
                          'Edit You ratings',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // encourage your user to leave a high rating?
                        message: Text(
                          'order #${order.orderId}',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 15, color: highLcolorLight),
                        ),
                        // logo
                        image: '$baseUrl/getProductImageByID/${product.id}',
                        submitButtonText: 'Submit',
                        submitButtonTextStyle:
                            TextStyle(color: highLcolor, fontSize: 18),
                        commentHint: 'Tell us about your experience',

                        onCancelled: () => print('cancelled'),
                        onSubmitted: (response) async {
                          print(
                              'rating: ${response.rating}, comment: ${response.comment}');

                          await Dio().post('$baseUrl/add_review/', data: {
                            "reviewId": order.id,
                            "orderId": order.orderId,
                            "rating": response.rating,
                            "reviewDesc": response.comment.toString()
                          });

                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              backgroundColor: highLcolor,
                              message: "Thank you for your feedback",
                            ),
                          );
                        },
                      );

                      showDialog(
                          context: context,
                          barrierDismissible:
                              true, // set to false if you want to force a rating
                          builder: (context) => rateDiaD);
                    }
                  },
                ),
              )
            : DataCell(
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff141414),
                    side: BorderSide(
                      color: highLcolorDark,
                      width: 1,
                    ),
                    primary: highLcolor,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'NT'),
                    ),
                  ),
                  onPressed: () async {
                    await API()
                        .updateOrderById(order.orderId, 'status', 'Canceled');
                    await API().updateOrderById(order.orderId, 'completeDate',
                        DateTime.now().toString());

                    getOrders();
                  },
                ),
              ),
      ],
    );
  }
}

class TextCell extends StatelessWidget {
  const TextCell({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: TextStyle(color: Colors.white),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextHeadingCell extends StatelessWidget {
  const TextHeadingCell({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: TextStyle(color: highLcolor, fontSize: 16),
    );
  }
}
