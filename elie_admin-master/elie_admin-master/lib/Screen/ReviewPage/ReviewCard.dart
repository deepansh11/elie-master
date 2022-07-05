import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReviewCard extends StatefulWidget {
  ReviewCard({Key? key, this.customer, this.order, this.item, this.stuffID}) : super(key: key);
  final customer;
  final order;
  final item;
  final stuffID;

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  late Order order;
  var customer;
  var item;
  var stuffID;
  var status;
  var done = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = widget.item;
    getReview();
  }

  getReview() async {
    order = Order.fromJson((await Dio().get("$baseURL/getOrderByOrderId/${item['orderId']}")).data);
    customer = await API().getCustomerByPhone(order.id);

    status = await item['status'];
    if (order.productId != null) {
      stuffID = 'product ID ${(await API().getProductsByID(order.productId)).id}';
    } else {
      stuffID = 'service ID ${(await API().getServiceByID(order.serviceId)).id}';
    }
    done = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(done);
    return done
        ? Stack(
            children: [
              Card(
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Column(
                            children: [
                              Text(
                                customer!.name,
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                "For OrderID ${order.orderId}",
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                "Status: ${status ? 'Show on the site' : "Hidden"}",
                                style: TextStyle(fontSize: 16, color: primaryColor),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Review: ${item['reviewDesc'] == '' ? "No review message" : item['reviewDesc']}",
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 9.0,
                          animation: true,
                          percent: (item['rating'] * 20) / 100,
                          center: new Text(
                            "${item['rating']}/5",
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          footer: new Text(
                            "For $stuffID",
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: GestureDetector(
                  onTap: () async {
                    if (status ?? false) {
                      await Dio()
                          .put('$baseURL/edit_singleStatus/${item['reviewId']}', queryParameters: {'orderId': item['orderId'], 'status': false});
                      status = false;
                      setState(() {});
                    } else {
                      await Dio()
                          .put('$baseURL/edit_singleStatus/${item['reviewId']}', queryParameters: {'orderId': item['orderId'], 'status': true});
                      setState(() {});
                      status = true;
                    }
                  },
                  child: status ?? false
                      ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outline_outlined,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text('Hide')
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.task_alt_outlined,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text('Accept')
                              ],
                            ),
                          ),
                        ),
                ),
              )
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}
