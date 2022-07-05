import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/AddItem/AddCoupon.dart';
import 'package:elie_admin/Screen/AddItem/AddItem.dart';
import 'package:elie_admin/Screen/AddItem/AddOrder.dart';
import 'package:elie_admin/Screen/AddItem/AddUser.dart';
import 'package:elie_admin/Screen/AddItem/EditItem.dart';
import 'package:elie_admin/Screen/AddItem/EditUser.dart';
import 'package:elie_admin/Screen/CouponPage/CouponPage.dart';
import 'package:elie_admin/Screen/Customer/CustomerPage.dart';
import 'package:elie_admin/Screen/Expert/ExpertPage.dart';
import 'package:elie_admin/Screen/OrderPage/Screens/ProductOrderDetail.dart';
import 'package:elie_admin/Screen/OrderPage/Screens/ServiceBookingDetail.dart';
import 'package:elie_admin/Screen/ProductsPage/ProductsPage.dart';
import 'package:elie_admin/Screen/ReviewPage/ReviewPage.dart';
import 'package:elie_admin/Screen/SOSpage/SOSpage.dart';
import 'package:elie_admin/Screen/ServicesPage/ServicesPage.dart';
import 'package:elie_admin/Screen/Tracking/TrackingPage.dart';
import 'package:flutter/material.dart';

import '../../Responsive Dashboard/dashboard_screen.dart';

List<Widget> views = [
  DashboardScreen(), //0
  TrackingPage(), //1
  ProductOrderDetail(), //2
  ServiceBookingDetail(), //3
  ProductPage(), //4
  ServicesPage(), //5
  CustomerPage(), //6
  ExpertPage(), //7
  ReviewPage(), //8
  CouponPage(), //9
  SOSpage(), //10
  AddItem(title: 'Product'), //11
  AddItem(title: 'Service'), //12
  AddUser(title: 'Expert'), //13
  AddUser(title: 'Customer'), //14
  EditItem(title: "Product"), //15
  EditItem(title: "Service"), //16
  EditUser(title: 'Customer'), //17
  EditUser(title: 'Expert'), //18
  AddOrder(title: 'Service'), //19
  AddCoupon(), //20
];
