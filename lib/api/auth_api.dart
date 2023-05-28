import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<bool> login(String username, String password) async {
    final url = Uri.parse('http://10.0.2.2:5000/login');

    final payload = json.encode({"username": username, "password": password});

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final response = await http.post(url, headers: headers, body: payload);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
