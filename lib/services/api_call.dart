import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_e_commerce_app/models/api_login_user_data_model.dart';

class CallApi {
  static Future fetchUsers(String username, String password) async {
    Map<String, dynamic> request = {
      'username': username, // kminchelle
      'password': password, // 0lelplR
    };

    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(
      url,
      body: request,
    );

    if (response.statusCode == 201) {
      return ApiLoginUserDataModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
