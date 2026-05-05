import 'package:flutter/material.dart';
import 'package:oylcars/models/car_model.dart';

class CarCard extends StatelessWidget {
  final CarModel car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF0B3A75);

    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          // 🔹 IMAGE + AVAILABLE TAG
          Stack(
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  car.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // AVAILABLE
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "AVAILABLE",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // ❤️ Heart icon
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.grey),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔹 NAME
          Text(
            "${car.brand} ${car.name} ${car.year}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: blue,
            ),
          ),

          const SizedBox(height: 8),

          // 🔹 TAGS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _tag(car.type),
              const SizedBox(width: 5),
              _tag(car.year.toString()),
              const SizedBox(width: 5),
              _tag("Automatic"),
            ],
          ),

          const SizedBox(height: 8),

          // 🔹 DETAILS
          const Text(
            "Petrol   36,000 km   White",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 10),

          const Text("Starting from"),

          Text(
            "AED ${car.price}/month",
            style: TextStyle(
              color: blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 BUTTON
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {},
              child: const Text("View Details"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}