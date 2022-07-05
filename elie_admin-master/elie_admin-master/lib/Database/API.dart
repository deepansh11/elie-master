import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Tracking.dart';
import 'package:elie_admin/Utils/Constants.dart';

import 'Cart.dart';
import 'Customers.dart';
import 'Locator.dart';
import 'Order.dart';
import 'Product.dart';
import 'Service.dart';

class API {
  late Response response;
  var dio = Dio();

  addCustomer(json) async {
    response =
        await dio.post('$baseURL/registerCustomer', data: jsonEncode(json));
  }

  addExpert(json) async {
    response =
        await dio.post('$baseURL/register_expert', data: jsonEncode(json));
  }

  addProduct(json) async {
    response = await dio.post('$baseURL/addProduct', data: jsonEncode(json));
    print(response);
    return response;
  }

  addService(json) async {
    response = await dio.post('$baseURL/addService', data: jsonEncode(json));
    return response;
  }

  addCart(json) async {
    response = await dio.post('$baseURL/addCart', data: jsonEncode(json));
  }

  deleteCart(id) async {
    response = await dio.delete('$baseURL/deleteCartById/$id');
  }

  deleteCartId(cartId, id) async {
    response = await dio.delete(
      '$baseURL/deleteCartByCartId/$cartId?id=$id',
    );
  }

  deleteExpert(id) async {
    response = await dio.delete(
      '$baseURL/delete_expert/$id',
    );
  }

  deleteProduct(id) async {
    response = await dio.delete(
      '$baseURL/deleteProduct/$id',
    );
  }

  deleteCustomer(id) async {
    response = await dio.delete(
      '$baseURL/deleteCustomer/$id',
    );
  }

  deleteService(id) async {
    response = await dio.delete(
      '$baseURL/deleteService/$id',
    );
  }

  updateQuantity(id, cartId, quantity) async {
    response = await dio.post(
      '$baseURL/updateQuantity/$id?cartId=$cartId&quantity=$quantity',
    );
  }

  addOrder(json) async {
    print(json.toString());
    response = await dio.post('$baseURL/addOrder', data: jsonEncode(json));
    return response;
  }

  Future<List<Customers>> getCustomer() async {
    response = await dio.get('$baseURL/getCustomer');

    if (response.statusCode == 200 && response.data != 0000) {
      List user = response.data;

      List<Customers> cards = user.map((e) => Customers.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<LocationTrackingOfExpert>> getAllLocationByExpert(phone) async {
    response = await dio.get(
      '$baseURL/total_tracking/$phone',
    );

    if (response.statusCode == 200) {
      List track = await response.data;

      var cards =
          track.map((e) => LocationTrackingOfExpert.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<LocationForTracking> getExpertday_tracking(phone, dateTime) async {
    response = await dio.get('$baseURL/day_tracking/$phone',
        queryParameters: {'thedatetime': dateTime});

    if (response.statusCode == 200) {
      var track = await response.data;

      var cards = LocationForTracking.fromJson(track);
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Experts>> getExperts() async {
    response = await dio.get('$baseURL/get_all_expert');

    if (response.statusCode == 200) {
      List user = response.data;

      List<Experts> cards = user.map((e) => Experts.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<Customers?> getCustomerByPhone(phone) async {
    response = await dio.get('$baseURL/getCustomerByPhone/$phone');

    if (response.statusCode == 200 && response.data != 0000) {
      var user = response.data;

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

  Future<List<Tracking>?> getExpertLocationById(id) async {
    response = await dio.get('$baseURL/total_tracking/$id');

    if (response.statusCode == 200) {
      List loc = response.data;
      List<Tracking> cards = loc.map((e) => Tracking.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      return null;
    }
  }

  Future<List<Experts?>> getExpertsByAvi(date) async {
    response = await dio.get('$baseURL/getExpertByAvailability',
        queryParameters: {'thedatetime': date, 'pincode': 000});

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

  Future<Experts?> getExpertByPhone(phone) async {
    response = await dio.get('$baseURL/get_expert_phone/$phone');

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

  Future<List<Product>> getProducts() async {
    response = await dio.get('$baseURL/getProduct');

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

  Future<Product> getProductsByID(id) async {
    response = await dio.get('$baseURL/getProductByID/$id');

    if (response.statusCode == 200 && response.data != null) {
      return Product.fromJson(response.data);
    } else {
      return Product(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }

  Future<Experts?> getExpertsByID(id) async {
    response = await dio.get('$baseURL/get_expert_phone/$id');

    if (response.statusCode == 200) {
      if (response.data != null) {
        return Experts.fromJson(response.data);
      } else {
        return null;
      }
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Services>> getServices() async {
    response = await dio.get('$baseURL/getService');

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

  Future<Services> getServiceByID(id) async {
    response = await dio.get('$baseURL/getServiceByID/$id');

    if (response.statusCode == 200 && response.data != null) {
      return Services.fromJson(response.data);
    } else {
      return Services(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }

  Future<List<Cart>> getCartById(id) async {
    response = await dio.get('$baseURL/getCartById/${getItUserIn.userPhone}');

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
    response = await dio.get('$baseURL/getOrderById/${getItUserIn.userPhone}');

    if (response.statusCode == 200) {
      List orderList = response.data;
      List<Order> cards = orderList.map((e) => Order.fromJson(e)).toList();

      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  Future<List<Order>> getOrderByExpertId(id) async {
    response = await dio.get('$baseURL/orders_by_expert/$id}');

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
    response = await dio.get('$baseURL/getOrder');

    if (response.statusCode == 200) {
      List serviceList = response.data;
      List<Order> cards = serviceList.map((e) => Order.fromJson(e)).toList();
      return cards;
    } else {
      print('Error!!');
      throw Exception('Failed to Load Post');
    }
  }

  updateOrderById(id, of, to) async {
    response = await dio.post(
      '$baseURL/updateOrderById/$id?of=$of&to=$to',
    );
  }
}
