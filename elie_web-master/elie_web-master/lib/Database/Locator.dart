import 'package:dio/dio.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'API.dart';
import 'Cart.dart';
import 'Order.dart';
import 'Product.dart';
import 'Service.dart';
import 'Tracking.dart';

final getIt = GetIt.instance;
var getItCart = getIt<CartData>();
var getItForStock = getIt<StockData>();
var getItPages = getIt<Pages>();
var getItUserIn = getIt<UserIn>();
var getItSearchBar = getIt<SearchBar>();
var getItOrderPage = getIt<OrderPageLocator>();
var getItOnce = getIt<Once>();

void setup() {
  getIt.registerLazySingleton<Pages>(() => Pages());
  getIt.registerLazySingleton<CartData>(() => CartData());
  getIt.registerLazySingleton<UserIn>(() => UserIn());
  getIt.registerLazySingleton<SearchBar>(() => SearchBar());
  getIt.registerLazySingleton<OrderPageLocator>(() => OrderPageLocator());
  getIt.registerLazySingleton<Once>(() => Once());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton<StockData>(() => StockData());
}

class SearchBar {
  late List<Product> listOfProducts;
  late List<Services> listOfServices;
}

class UserIn {
  var userPhone;
  var userPass;
  var userName;
  var email;
  var ordered = false;

  setUserIn(phone, pass, userName, email) {
    this.userPhone = phone;
    this.userPass = pass;
    this.userName = userName;
    this.email = email;
  }
}

class StockData {
  late List<Cart> cartData;

  setStockItems(cartData) {
    this.cartData = cartData;
  }
}

class Pages {
  String currentPage = '/';
  var contextOfDatePicker;
  var contextOfLocationPage;
  var contextOfHomeAddress;
  var disableColorTOP;
  var onTapTopBar = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  setonTapTopBar(x, bool) {
    this.onTapTopBar[x] = bool;
  }

  getTapColorChange(f) {
    disableColorTOP = f;
  }

  setContextDATE(context) {
    this.contextOfDatePicker = context;
  }

  setContextHomeAddress(context) {
    this.contextOfHomeAddress = context;
  }

  setContextLOCATION(context) {
    this.contextOfLocationPage = context;
  }

  setCurrentPathANDTopColorOFF(page) {
    currentPage = page;
    disableColorTOP();
  }
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}

class CartData extends ChangeNotifier {
  //service & product
  var productId;
  var orderId;
  var productImage;
  var productTitle;
  var productPrice;
  var productDesc;
  Product? productData;
  Services? serviceData;
  //Location
  var location = "At Home";
  var pin;
  var latlong;
  // date % time
  var date;
  var time;
  var isSpa;
  var isPackage;
  //expert
  var expertId;
  var coupon;

  //Cart Total Amount
  var totAmount;
  //CartList
  List<Map> cartItems = [];

  setLatlong(lat, long) {
    this.latlong = LocationForTracking(lat, long);
  }

  addToCart(isProduct) async {
    List<Cart> list = await API().getCartById(getItUserIn.userPhone);

    var parsedJson;

    if (isProduct) {
      totAmount = productData!.salePrice ?? 0.0;
      parsedJson = Cart(
              getItUserIn.userPhone,
              list.length + 1,
              productData!.id,
              null,
              location,
              latlong,
              DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
              DateFormat('hh:mm a').format(DateTime.now()).toString(),
              null,
              totAmount,
              1)
          .toJson();
    } else {
      totAmount = double.parse(serviceData!.saleCost.toString());
      parsedJson = Cart(
              getItUserIn.userPhone,
              list.length + 1,
              null,
              serviceData!.id,
              location,
              latlong,
              date,
              time.toString(),
              expertId,
              totAmount,
              1)
          .toJson();
    }

    await API().addCart(parsedJson);

    ////////////EMPTYING////////////EMPTYING////////////EMPTYING////////////EMPTYING
    productId = 0;
    location = '';
    expertId = 0;
  }

  addToOrder(Cart d) async {
    var parsedJson;
    var count = (await API().getOrder()).length;

    var latL = latlong;

    parsedJson = Order(
      getItUserIn.userPhone,
      count + 1,
      d.productId,
      d.serviceId,
      d.location,
      latL,
      d.date ?? DateTime.now(),
      d.time ?? DateTime.now(),
      d.expertId,
      d.totAmount,
      "Order Received",
      'online',
      true,
      d.quantity,
      '',
    ).toJson();

    var id = await API().addOrder(parsedJson);
    print(id.data['orderId']);
    if (d.serviceId != null) {
      var service = await API().getServiceByID(d.serviceId);

      var startTimee =
          DateFormat('dd/MM/yyyyTh:mm a').parse(d.date + 'T' + d.time);
      var endTimee = startTimee.add(Duration(minutes: service.duration));
      var startTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(startTimee);
      var endTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(endTimee);
      print(startTime);
      await Dio().post("$baseUrl/add_booking", data: {
        "orderId": id.data['orderId'],
        "expertId": d.expertId,
        "startTime": startTime,
        "endTime": endTime,
      });
    }

    orderId = id.data['orderId'];
  }

  removeFromCart(index) {
    totAmount = totAmount - cartItems.elementAt(index)['productPrice'];
    cartItems.removeAt(index);
  }

  clearCart() {
    print('Cart cleared');
    cartItems.clear();
    notifyListeners();
  }

  setAmt(double a) {
    totAmount = a;
    notifyListeners();
  }

  setDate(d) {
    date = d;
  }

  setLocation(l) {
    location = l;
  }

  setPin(p) {
    pin = p;
  }

  setTime(t) {
    time = t;
  }

  setSpa(s) {
    isSpa = s;
  }

  setExpertData(e) {
    expertId = e;
  }

  setProductData(d, check) {
    if (check) {
      productData = d;
    } else {
      serviceData = d;
    }
  }
}

class OrderPageLocator extends ChangeNotifier {
  //sideBar index
  List pageList = [1, 2, 3, 4, 5, 6, 7];
  int pageIndex = 2;

  setPageIndex(i) {
    pageIndex = i;
    notifyListeners();
  }
}

class Once {
  var home = false;
  var salon = false;
  var product = false;
  var education = false;
  var fitness = false;
  var event = false;
  var tattoo = false;
}
