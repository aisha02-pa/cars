import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/car_model.dart';

class HomeController extends GetxController {
  var carList = <CarModel>[].obs;
  var isLoading = false.obs;
  

  @override
  void onInit() {
    fetchCars();
    super.onInit();
  }
void fetchCars() async {
  try {
    print("API HIT 🔥");
    isLoading.value = true;

    final response = await http.get(
      Uri.parse("https://api.oylcars.com/api/cars"),
    );

    print("STATUS: ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List cars = data['cars']; // ✅ FIXED

      carList.value =
          cars.map((e) => CarModel.fromJson(e)).toList();

      print("DATA LENGTH: ${carList.length}");
    }
  } catch (e) {
    print("Error: $e");
  } finally {
    isLoading.value = false;
  }
}
}