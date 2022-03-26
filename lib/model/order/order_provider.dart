import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  Map<String, dynamic> orders = {};
  var _deliveredOrders = [];
  var _currentOrders = [];

  Map<String, dynamic> get getOrders {
    return {...orders};
  }

  List get getDeliveredOrders {
    return [..._deliveredOrders];
  }

  List get getCurrentOrders {
    return [..._currentOrders];
  }

  String url = 'https://achievexsolutions.in/current_work/eatiano/';

  Future<void> fetchData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.getString('token');
    final finalUrl = Uri.parse(url + 'api/delivery/delivery');
    final response = await http.get(finalUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}',
    });
    Orders ordersList = ordersFromJson(response.body);
    orders = ordersList.toJson();

    _deliveredOrders = filterOrders('delivered');
    _currentOrders = filterOrders('pickup');

    print('current-orders:$_currentOrders');
    print('delivered-orders:$_deliveredOrders');

    // print(orders);
    // print(response.body);
  }

  List filterOrders(String status) {
    return orders['data'].where((item) {
      return item['status'] == status;
    }).toList();
  }
}
