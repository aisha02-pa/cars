import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CarDetailsView extends StatelessWidget {
  final String carId;

  const CarDetailsView({super.key, required this.carId});

  Future<Map<String, dynamic>> fetchCarDetails() async {
    final response = await http.get(
      Uri.parse("https://api.oylcars.com/api/cars/$carId"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["data"];
    } else {
      throw Exception("Failed to load car");
    }
  }

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF0B3A75);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: blue,
        elevation: 0,
        title: const Text("Back to Listings"),
      ),

      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchCarDetails(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Error loading car"));
          }

          final car = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 🔹 TITLE
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${car['brand']} ${car['model']} ${car['year']}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "${car['type'] ?? ''} • Automatic • Petrol",
                        style: const TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 10),

                      const Text("STARTING FROM"),
                      Text(
                        "AED ${car['price']}/mo",
                        style: TextStyle(
                          color: blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 IMAGE
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      car['image'] ?? "",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 SPECIFICATIONS
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Vehicle Specifications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                _spec("Year", "${car['year'] ?? 'N/A'}"),
                _spec("Mileage", "${car['kms'] ?? car['mileage'] ?? 'N/A'}"),
                _spec("Transmission", "${car['transmission'] ?? 'Automatic'}"),
                _spec("Fuel Type", "${car['fuel_type'] ?? car['fuel'] ?? 'Petrol'}"),
                _spec("Color", "${car['color'] ?? 'N/A'}"),
                _spec("Seats", "${car['seats'] ?? 'N/A'}"),

                const SizedBox(height: 20),

                // 🔹 ABOUT
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "About This Vehicle",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    car['description'] ?? "No description available",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  // 🔹 SPEC ROW
  Widget _spec(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}