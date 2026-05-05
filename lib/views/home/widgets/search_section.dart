import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF0B3A75);

    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // 🔹 Title
          const Text(
            "Find Your Car",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B3A75),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Rounded Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [

                // 🔹 Input
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your monthly budget (AED)",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // 🔹 Search Button (circle)
                Container(
                  decoration: BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Advanced Filters
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.tune, color: blue, size: 20),
              const SizedBox(width: 6),
              Text(
                "Advanced Filters",
                style: TextStyle(
                  color: blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔹 View All
          Text(
            "View All",
            style: TextStyle(
              color: blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}