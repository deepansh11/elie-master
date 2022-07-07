import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'API.dart';
import 'Cart.dart';
import 'Order.dart';
import 'Product.dart';
import 'Service.dart';

final getIt = GetIt.instance;
var getItCart = getIt<CartData>();
var getItPages = getIt<Pages>();
var getItUserIn = getIt<UserIn>();
var getItSearchBar = getIt<SearchBar>();
var getItOrderPage = getIt<OrderPageLocator>();
var getItAdminCurrentPage = getIt<AdminCurrentPage>();
var getItProductData = getIt<ProductData>();
var getItServiceData = getIt<ServiceData>();
var getItEditProduct = getIt<EditProduct>();
var getItEditUser = getIt<EditUser>();
var getItTrackingPageLocator = getIt<TrackingPageLocator>();
var getItEditExpert = getIt<EditExpert>();

void setup() {
  getIt.registerLazySingleton<Pages>(() => Pages());
  getIt.registerLazySingleton<CartData>(() => CartData());
  getIt.registerLazySingleton<UserIn>(() => UserIn());
  getIt.registerLazySingleton<SearchBar>(() => SearchBar());
  getIt.registerLazySingleton<OrderPageLocator>(() => OrderPageLocator());
  getIt.registerLazySingleton<AdminCurrentPage>(() => AdminCurrentPage());
  getIt.registerLazySingleton<ProductData>(() => ProductData());
  getIt.registerLazySingleton<ServiceData>(() => ServiceData());
  getIt.registerLazySingleton<EditProduct>(() => EditProduct());
  getIt.registerLazySingleton<EditUser>(() => EditUser());
  getIt.registerLazySingleton<TrackingPageLocator>(() => TrackingPageLocator());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton<EditExpert>(() => EditExpert());
}

class SearchBar {
  late List<Product> listOfProducts;
  late List<Services> listOfServices;
}

class AdminCurrentPage extends ChangeNotifier {
  var index;

  setIndex(i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(Duration(milliseconds: 100), () {
      prefs.setInt('pageIndex', i);
      this.index = i;

      print(this.index);

      notifyListeners();
    });
  }
}

class EditProduct {
  var name;
  var price;
  var salePrice;
  var desc;
  var duration;
  var tax;
  var stock;
  var lowStock;
  var status;
  var id;
  var isSpa, aff, hsn, sku, category;
  setProduct(n, p, sp, ds, d, t, s, ls, st, i, isSpa, aff, hsn, sku, category) {
    this.name = n;
    this.price = p;
    this.salePrice = sp;
    this.desc = ds;
    this.duration = d;
    this.tax = t;
    this.stock = s;
    this.lowStock = ls;
    this.status = st;
    this.id = i;
    this.isSpa = isSpa;
    this.aff = aff;
    this.hsn = hsn;
    this.sku = sku;
    this.category = category;
  }
}

class EditExpert {
  var name;
  var sex;
  var phone;
  var email;
  var password;
  var age;
  var dob;
  var averageRating;
  var reviewId;
  var availability;
  var last_location;
  var status;
  var totalTips;
  var totalCommission;
  var panNo;
  var qualifications;
  var serviceList;
  var servicablePins;
  var isEmployee;

  setExpert(
      name,
      sex,
      phone,
      email,
      password,
      age,
      dob,
      averageRating,
      reviewId,
      availability,
      last_location,
      status,
      totalTips,
      totalCommission,
      panNo,
      qualifications,
      serviceList,
      servicablePins,
      isEmployee) {
    this.name = name;
    this.sex = sex;
    this.age = age;
    this.availability = availability;
    this.averageRating = averageRating;
    this.dob = dob;
    this.email = email;
    this.password = password;
    this.isEmployee = isEmployee;
    this.last_location = last_location;
    this.panNo = panNo;
    this.phone = phone;
    this.qualifications = qualifications;
    this.reviewId = reviewId;
    this.servicablePins = servicablePins;
    this.serviceList = serviceList;
    this.status = status;
    this.totalCommission = totalCommission;
    this.totalTips = totalTips;
  }
}

class EditUser {
  var name;
  var phone;
  var email;
  var pass;
  var age;
  var gender;
  var dob;
  var anniversary;
  var bloodGrp;
  var id;

  setProduct(n, p, e, pas, age, g, dob, a, bg, i) {
    this.name = n;
    this.phone = p;
    this.email = e;
    this.pass = pas;
    this.age = age;
    this.gender = g;
    this.dob = dob;
    this.anniversary = a;
    this.bloodGrp = bg;
    this.id = i;
  }
}

class UserIn {
  var userPhone;
  var userPass;
  var userName;
  var email;

  setUserIn(phone, pass, userName, email) {
    this.userPhone = phone;
    this.userPass = pass;
    this.userName = userName;
    this.email = email;
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

class ProductData {
  setProductData(
      id,
      productTitle,
      productImage,
      productDesc,
      regularPrice,
      salePrice,
      reviewId,
      tax,
      stock,
      lowStockThreshold,
      status,
      size,
      weight,
      aff,
      hsn,
      sku) {
    this.id = id;
    this.productTitle = productTitle;
    this.productImage = productImage;
    this.productDesc = productDesc;
    this.regularPrice = regularPrice;
    this.salePrice = salePrice;
    this.reviewId = reviewId;
    this.tax = tax;
    this.stock = stock;
    this.lowStockThreshold = lowStockThreshold;
    this.status = status;
    this.size = size;
    this.weight = weight;
    this.aff = aff;
    this.sku = sku;
    this.hsn = hsn;
  }

  var id;
  var productTitle;
  var productImage;
  var productDesc;
  var regularPrice;
  var salePrice;
  var reviewId;
  var tax;
  var stock;
  var lowStockThreshold;
  var status;
  var size;
  var weight, aff, hsn, sku;

  addProduct() async {
    var parsedJson = Product(
            id,
            productTitle,
            productImage,
            productDesc,
            regularPrice,
            salePrice,
            reviewId,
            tax,
            stock,
            lowStockThreshold,
            status,
            size,
            weight,
            aff,
            hsn,
            sku)
        .toJson();
    return await API().addProduct(parsedJson);
  }
}

class TrackingPageLocator extends ChangeNotifier {
  var selected;

  setSelected(s) {
    selected = s;
    notifyListeners();
  }
}

class ServiceData {
  setServiceData(id, name, image, desc, duration, cost, saleCost, reviewId, tax,
      status, serviceProviderId, isSpa, category) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.desc = desc;
    this.duration = duration;
    this.cost = cost;
    this.saleCost = saleCost;
    this.reviewId = reviewId;
    this.tax = tax;
    this.status = status;
    this.serviceProviderId = serviceProviderId;
    this.isSpa = isSpa;
    this.category = category;
  }

  var id;
  var name;
  var image;
  var desc;
  var duration;
  var cost;
  var saleCost;
  var reviewId;
  var tax;
  var status;
  var serviceProviderId;
  var isSpa, category;

  addService() async {
    var parsedJson = Services(id, name, image, desc, duration, cost, saleCost,
            reviewId, tax, status, serviceProviderId, isSpa, category)
        .toJson();

    return await API().addService(parsedJson);
  }
}

class CartData extends ChangeNotifier {
  //service & product
  var productId;
  var productImage;
  var productTitle;
  var productPrice;
  var productDesc;
  Product? productData;
  Services? serviceData;
  //Location
  var location = "At Home";
  // date % time
  var date;
  var time;
  //expert
  var expertId;
  var expertName;
  var expertImage;
  var availability;

  //Cart Total Amount
  var totAmount;
  //CartList
  List<Map> cartItems = [];

  addToCart(isProduct) async {
    List<Cart> list = await API().getCartById(getItUserIn.userPhone);

    var parsedJson;

    if (isProduct) {
      totAmount = productData!.salePrice.toDouble();
      parsedJson = Cart(
              getItUserIn.userPhone,
              list.length + 1,
              productData!.id,
              null,
              location,
              DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
              DateFormat('h:m').format(DateTime.now()).toString(),
              2,
              totAmount,
              1)
          .toJson();
    } else {
      totAmount = serviceData!.saleCost.toDouble();
      parsedJson = Cart(getItUserIn.userPhone, list.length + 1, null,
              serviceData!.id, location, date, time, 1, totAmount, 1)
          .toJson();
    }

    await API().addCart(parsedJson);

    ////////////EMPTYING////////////EMPTYING////////////EMPTYING////////////EMPTYING
    productId = 0;
    location = '';
    expertId = 0;
    date = DateRangePickerSelectionChangedArgs(DateTime.now());
    time = '';
  }

  addToOrder(Cart d) async {
    var parsedJson;
    var count = (await API().getOrder()).length;

    parsedJson = Order(
            getItUserIn.userPhone,
            count + 1,
            d.productId,
            d.serviceId,
            d.location,
            d.date,
            d.time,
            d.expertId,
            d.totAmount,
            "Order Recived",
            'online',
            false,
            d.quantity,
            '')
        .toJson();

    await API().addOrder(parsedJson);
  }

  removeFromCart(index) {
    totAmount = totAmount - cartItems.elementAt(index)['productPrice'];
    cartItems.removeAt(index);
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

  setTime(t) {
    time = t;
  }

  setExpertData(n, a, i) {
    expertName = n;
    expertImage = i;
    availability = a;
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
  int pageIndex = 1;

  setPageIndex(i) {
    pageIndex = i;
    notifyListeners();
  }
}
