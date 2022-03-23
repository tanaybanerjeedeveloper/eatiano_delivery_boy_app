import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  Map<String, dynamic> orders = {};

  Map<String, dynamic> get getOrders {
    return {...orders};
  }

  String url = 'https://achievexsolutions.in/current_work/eatiano/';

  Future<void> fetchData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.getString('token');
    final finalUrl = Uri.parse(url + 'api/delivery/delivery_status');
    final response = await http.get(finalUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}',
    });
    Orders ordersList = ordersFromJson(response.body);
    orders = ordersList.toJson();
    print(orders);
  }
}
