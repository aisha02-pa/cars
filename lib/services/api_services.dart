import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.oylcars.com/api/auth";
  static Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String whatsapp,
  }) async {
    var body = {
      "name": name,
      "email": email,
      "contactNumber": phone,
      "password": password,
      "whatsappNumber": whatsapp,
    };
    var data = jsonEncode(body);
    log("the passing data is $data");

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/customer/signup"),
        headers: {"Content-Type": "application/json"},
        body: data,
      );
      log("the api heades is ${response.headers} ${response.request}");
      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        log("data is $data");

        return {
          "status": true,
          "message": data['message'] ?? "Signup success",
          "token": data['token'], // if available
        };
      } else {
        return throw "Singup fails ";
        // return {
        //   "status": false,
        //   "message": jsonDecode(response.body)['message'] ?? "Signup failed",
        // };
      }
    } catch (e) {
      log("The catched error is $e");
      return throw "Error found $e";
    }
  }

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    print("LOGIN STATUS: ${response.statusCode}");
    print("LOGIN BODY: ${response.body}");

    return jsonDecode(response.body);
  }

  static Map<String, String> getHeaders() {
    final box = GetStorage();
    String? token = box.read("token");

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Future<Map<String, dynamic>> getProfile() async {
    final response = await http.get(
      Uri.parse("$baseUrl/profile"),
      headers: getHeaders(), // ✅ token added here
    );

    return jsonDecode(response.body);
  }
}