import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final blue = Color(0xFF0B3A75);

    return Container(
      width: double.infinity,
      color: blue,
      child: Column(
        children: [

          const SizedBox(height: 20),

          Image.asset(
            "assets/carlogo.png", 
            height: 100,
          ),

          const SizedBox(height: 20),

          
          const Text(
            "WHY RENT A CAR?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

         
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "When you can own the same car that too without any additional monthly expenses",
              style: TextStyle(color: Colors.cyanAccent),
            ),
          ),

          const SizedBox(height: 20),

         
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Drive it home from day one... We take care of everything - insurance, maintenance, and finance. Forget the hassle, just feel the freedom. Your dream car is waiting, but it won't be for long. Schedule your appointment today",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white70),
            ),
          ),

          const SizedBox(height: 20),

         
          ElevatedButton(
            onPressed: () {},
            child: const Text("Start Your Journey"),
          ),

          const SizedBox(height: 20),

      
          Image.asset("assets/car_girl.jpg"),
        ],
      ),
    );
  }
}