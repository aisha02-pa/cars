import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF0B3A75);

    Widget _button(String text, IconData icon) {
  return Expanded( // makes both buttons share space equally
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(
        text,
        overflow: TextOverflow.ellipsis,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0B3A75),
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
         minimumSize: const Size(0, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

    return Container(
      width: double.infinity,
      color: blue,
      child: Column(
        children: [

          // 🔹 Top Row (logo + menu)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/logoheaderoyl.png",
                  height: 40,
                ),
                const Icon(Icons.menu, color: Colors.white),
              ],
            ),
          ),


          Padding(
  padding: const EdgeInsets.only(right: 16, bottom: 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _button("Sell a Car", Icons.directions_car),
      const SizedBox(width: 10),
      _button("Book Appointment", Icons.calendar_today),
    ],
  ),
),
        ],
      ),
    );
  }

  Widget _button(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}