import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_e_commerce_app/models/api_login_user_data_model.dart';
import 'package:my_e_commerce_app/models/api_products_data_model.dart';

class ApiCall {
  static Future fetchUsers(String username, String password) async {
    Map<String, dynamic> request = {
      'username': username, // kminchelle
      'password': password, // 0lelplR
    };

    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request),
    );

    if (response.statusCode == 200) {
      return ApiLoginUserDataModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return null;
    }
  }

  static Future fetchAllProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ApiProductsDataModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return null;
    }
  }

  static Future fetchSingleProduct(int id) async {
    final url = Uri.parse('https://dummyjson.com/products/$id');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ApiProductsDataModelProducts.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return null;
    }
  }
}
