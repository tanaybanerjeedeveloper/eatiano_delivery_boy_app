import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class NetworkingService {
  String url;

  NetworkingService(this.url);

  Future<dynamic> getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200) {
      var data = response.body;
      print('data: ${jsonDecode(data)}');
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
