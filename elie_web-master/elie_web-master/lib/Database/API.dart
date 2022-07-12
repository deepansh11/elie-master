import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'Cart.dart';
import 'Expert.dart';
import 'Locator.dart';
import 'Order.dart';
import 'Customers.dart';
import 'Product.dart';
import 'Service.dart';
import 'Tracking.dart';

class API {
  late Response response;
  var dio = Dio();

  addCustomer(json) async {
    response =
        await dio.post('$baseUrl/registerCustomer', data: jsonEncode(json));
  }

  addLocationTrack(json) async {
    response =
        await dio.post('$baseUrl:8001/add_track', data: jsonEncode(json));
  }

  addCart(json) async {
    response = await dio.post('$baseUrl/addCart', data: jsonEncode(json));
  }

  deleteCart(id) async {
    response = await dio.delete('$baseUrl/deleteCartById/$id');
  }

  deleteCartId(cartId, id) async {
    response = await dio.delete(
      '$baseUrl/deleteCartByCartId/$cartId?id=$id',
    );
  }

  updateQuantity(id, cartId, quantity) async {
    response = await dio.put(
      '$baseUrl/updateQuantity/$id?cartId=$cartId&quantity=$quantity',
    );
  }

  updateStock(productId, quantity) async {
    // https://api.elie.world/updateProductInventoryAfterCheckOut/7?decrease_stock_by=-1'
    response = await dio.put(
      '$baseUrl/updateProductInventoryAfterCheckOut/$productId?decrease_stock_by=-$quantity',
    );
    print(response);
  }

  Future<Response> addOrder(json) async {
    print(json.toString());
    response = await dio.post('$baseUrl/addOrder', data: jsonEncode(json));
    return response;
  }

  Future<List<Customers>> getCustomer() async {
    response = await dio.get('$baseUrl/getCustomer');

    if (response.statusCode == 200 && response.data != 0000) {
      List user = response.data;

      List<Customers> cards = user.map((e) => Customers.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Experts?>> getExpertsByAvi(date, pin) async {
    response = await dio.get('$baseUrl/getExpertByAvailability',
        queryParameters: {'thedatetime': date, 'thePin': pin});

    if (response.statusCode == 200 && response.data != 0000) {
      List user = response.data;
      List<Experts?> cards = [];
      for (var e in user) {
        cards.add(await getExpertByPhone(e));
      }

      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<Customers?> getCustomerByPhone(phone) async {
    response = await dio.get('$baseUrl/getCustomerByPhone/$phone');

    if (response.statusCode == 200 && response.data != 0000) {
      var user = await response.data;

      if (user != null) {
        var cards = Customers.fromJson(user);
        return cards;
      } else {
        return null;
      }
    } else {
      print('Error!!');
      return null;
    }
  }

  Future<Experts?> getExpertByPhone(phone) async {
    response = await dio.get('$baseUrl/get_expert_phone/$phone');

    if (response.statusCode == 200 && response.data != 0000) {
      var user = response.data;

      if (user != null) {
        var cards = Experts.fromJson(user);
        return cards;
      } else {
        print('expert null');
        return null;
      }
    } else {
      print('Error!!');
      return null;
    }
  }

  Future<List<Tracking>?> getExpertLocationById(id) async {
    response = await dio.get('$baseUrl/total_tracking/$id');

    if (response.statusCode == 200) {
      List loc = response.data;
      List<Tracking> cards = loc.map((e) => Tracking.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      return null;
    }
  }

  Future<List<Product>> getProducts() async {
    response = await dio.get('$baseUrl/getProduct');

    if (response.statusCode == 200) {
      List productList = response.data;
      List<Product> cards =
          productList.map((e) => Product.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Product>> getProductsExceptCart(phone) async {
    response = await dio.get('$baseUrl/get_all_products_except_cart/$phone');

    if (response.statusCode == 200) {
      List<Product> cards = [];
      for (var d in response.data) {
        cards.add(await getProductsByID(d));
      }
      print(cards);
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<Product> getProductsByID(id) async {
    response = await dio.get('$baseUrl/getProductByID/$id');

    if (response.statusCode == 200 && response.data != null) {
      print(response.data);
      return Product.fromJson(response.data);
    } else {
      return Product(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }

  Future<List<Services>> getServices() async {
    response = await dio.get('$baseUrl/getService');

    if (response.statusCode == 200) {
      List serviceList = response.data;
      List<Services> cards =
          serviceList.map((e) => Services.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Packages>?> getPackages() async {
    // response = await dio.get('$baseUrl/getPackage');

    // if (response.statusCode == 200) {
    //   final List packages = response.data;

    //   final List<Packages>? packagesList =
    //       packages.map((e) => Packages.fromJson(e)).toList();
    //   return packagesList;
    // } else {
    //   print('Error!!');
    //   throw Exception('Failed to Load Packages');
    // }
    List<Packages>? packagesList = [];
    await Future.delayed(Duration(seconds: 1), () {
      packagesList = dummyJson.map((e) => Packages.fromJson(e)).toList();
    });
    return packagesList;
  }

  Future<Packages?> getPackagesById(String? id) async {
    // response = await dio.get('$baseUrl/getPackageById/$id');
    Packages? packages;
    await Future.delayed(Duration(seconds: 1), () {
      List<Packages?> data =
          dummyJson.map((e) => Packages.fromJson(e)).toList();
      packages = data.firstWhere((element) => element?.id.toString() == id);
    });
    return packages;
    // return Packages.fromJson();
  }

  Future<Services> getServiceByID(id) async {
    response = await dio.get('$baseUrl/getServiceByID/$id');

    if (response.statusCode == 200) {
      return Services.fromJson(response.data);
    } else {
      return Services(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Cart>> getCartById(id) async {
    response = await dio.get('$baseUrl/getCartById/${getItUserIn.userPhone}');

    if (response.statusCode == 200) {
      List cartList = response.data;

      List<Cart> cards = cartList.map((e) => Cart.fromJson(e)).toList();

      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Order>> getOrderById(id) async {
    response = await dio.get('$baseUrl/getOrderById/${getItUserIn.userPhone}');

    if (response.statusCode == 200) {
      List orderList = response.data;
      List<Order> cards = orderList.map((e) => Order.fromJson(e)).toList();

      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Order>> getOrder() async {
    response = await dio.get('$baseUrl/getOrder');

    if (response.statusCode == 200) {
      List serviceList = response.data;
      List<Order> cards = serviceList.map((e) => Order.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Order>> getOrderByExpert(phone) async {
    response = await dio.get('$baseUrl/orders_by_expert/$phone');

    if (response.statusCode == 200) {
      List serviceList = response.data;
      List<Order> cards = serviceList.map((e) => Order.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<Order> getOrderByOrderId(orderId) async {
    response = await dio.get('$baseUrl/getOrderByOrderId/$orderId');

    if (response.statusCode == 200) {
      return Order.fromJson(response.data);
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  updateOrderById(id, of, to) async {
    response = await dio.post(
      '$baseUrl/updateOrderById/$id?of=$of&to=$to',
    );
  }
}
