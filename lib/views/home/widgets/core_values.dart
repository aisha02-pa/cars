import 'package:flutter/material.dart';

class CoreValuesSection extends StatelessWidget {
  const CoreValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          const Text(
            "Our Core Values",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B3A75),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 First Card (Full Width)
          _card(
            number: "1",
            title: "Own from Day One",
            desc:
                "Full ownership begins with your first payment, no waiting, no leasing.",
            fullWidth: true,
          ),

          const SizedBox(height: 15),

          // 🔹 Two Cards Row
          Row(
            children: [
              Expanded(
                child: _card(
                  number: "2",
                  title: "Complete Management",
                  desc:
                      "Finance, insurance, and maintenance, all handled seamlessly by OyL.",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _card(
                  number: "3",
                  title: "Vehicle Replacement",
                  desc:
                      "In case of any breakdowns, we replace your car instantly so your journey never stops.",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card({
    required String number,
    required String title,
    required String desc,
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B3A75),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          // 🔹 Circle Number
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: Text(
              number,
              style: const TextStyle(
                color: Color(0xFF0B3A75),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // 🔹 Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          // 🔹 Description
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}