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
  }) async {
    final response = await http.post(
Uri.parse("$baseUrl/register"),
       headers: {
        "Content-Type": "application/json",
      },
      body:jsonEncode( {
         "name": name,
  "email": email,
  "phone": phone,
  "password": password,
      }),
    );

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
  return {
    "status": false,
    "message": jsonDecode(response.body)['message'] ?? "Signup failed"
  };
}
}
   
  

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
Uri.parse("$baseUrl/login"),
     headers: {
      "Content-Type": "application/json",
     
    },
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
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