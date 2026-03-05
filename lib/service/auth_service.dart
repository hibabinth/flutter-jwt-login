import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  Future<User?> login(String username, String password) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print("Access Token: ${data["accessToken"]}");

      return User.fromJson(data);
    } else {
      print("Login failed: ${response.body}");
      return null;
    }
  }
}
