import 'dart:js' as js;

import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Product.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({
    Key? key,
    required this.item,
    required this.id,
    required this.index,
    this.func,
  }) : super(key: key);

  final item;
  final id;
  final index;
  final func;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(4))),
          margin: EdgeInsets.all(2),
          child: IconButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                        title: Center(
                          child: Column(
                            children: [
                              Icon(Icons.delete_outlined,
                                  size: 36, color: Colors.red),
                              SizedBox(height: 20),
                              Text("Confirm"),
                            ],
                          ),
                        ),
                        content: Container(
                          height: 70,
                          child: Column(
                            children: [
                              Text("Are you sure you want to detele this?"),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.close,
                                        size: 14,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.grey),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      label: Text("Cancel")),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.delete,
                                        size: 14,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.redAccent),
                                      onPressed: () async {
                                        if (item == 'p') {
                                          print(id);
                                          await API().deleteProduct(id);
                                        } else if (item == 's') {
                                          await API().deleteService(id);
                                        } else if (item == 'c') {
                                          await API().deleteCustomer(id);
                                        } else if (item == 'e') {
                                          await API().deleteExpert(id);
                                        }
                                        Navigator.pop(context);
                                        func();
                                      },
                                      label: Text("Delete"))
                                ],
                              )
                            ],
                          ),
                        ));
                  });
              imageCache.clear();
            },
            icon: Icon(
              Icons.delete_outlined,
            ),
          ),
        ),
        Container(
          // decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(4))),
          margin: EdgeInsets.all(2),
          child: IconButton(
            onPressed: () async {
              if (item == 'p') {
                Product product = await API().getProductsByID(id);
                getItEditProduct.setProduct(
                    product.productTitle,
                    product.regularPrice,
                    product.salePrice,
                    product.productDesc,
                    0,
                    product.tax,
                    product.stock,
                    product.lowStockThreshold,
                    product.status,
                    id,
                    true,
                    product.aff,
                    product.hsn,
                    product.sku,
                    '');
                getItAdminCurrentPage.setIndex(15);
              } else if (item == 's') {
                Services service = await API().getServiceByID(id);
                getItEditProduct.setProduct(
                    service.name,
                    service.cost,
                    service.saleCost,
                    service.desc,
                    service.duration,
                    service.tax,
                    0,
                    0,
                    service.status,
                    id,
                    service.isSpa,
                    '',
                    '',
                    '',
                    service.category);
                getItAdminCurrentPage.setIndex(16);
              } else if (item == 'c') {
                Customers? customer = await API().getCustomerByPhone(id);
                getItEditUser.setProduct(
                  customer!.name,
                  customer.phone,
                  customer.email,
                  0,
                  customer.age,
                  customer.sex,
                  customer.dob,
                  customer.anniversary,
                  customer.bloodGrp,
                  id,
                );
                getItAdminCurrentPage.setIndex(17);
              } else if (item == 'e') {
                Experts? expert = await API().getExpertsByID(id);

                getItEditUser.setProduct(
                  expert!.name,
                  expert.phone,
                  expert.email,
                  expert.password,
                  expert.age,
                  expert.sex,
                  expert.dob,
                  0,
                  0,
                  id,
                );
                getItAdminCurrentPage.setIndex(18);
              }
              imageCache.clear();
            },
            icon: Icon(
              Icons.edit_outlined,
            ),
          ),
        ),
        Container(
          // decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(4))),
          margin: EdgeInsets.all(2),
          child: item == 's' || item == 'p'
              ? IconButton(
                  onPressed: () {
                    imageCache.clear();
                    if (item == 's') {
                      js.context.callMethod(
                          'open', ['http://elie.world/ServiceDescPage/$id']);
                    } else if (item == 'p') {
                      js.context.callMethod(
                          'open', ['http://elie.world/ProductDescPage/$id']);
                    }
                  },
                  icon: Icon(
                    Icons.visibility_outlined,
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
