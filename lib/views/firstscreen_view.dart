
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:oylcars/routes/app_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B3A75),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

           Image.asset(
              "assets/Yl_Cars_Logo.svg",
              height: 120,
           ),
           SizedBox(height: 30),

           Text("Own from Day One",
           style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
           ),),
SizedBox(height: 10),

       Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Finance, insurance, and maintenance,\nall handled seamlessly by Oyl.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange[200],
                  fontSize: 14,
                ),
              ),
            ),

            Spacer(),
       Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD2A679), // beige color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
Get.offAllNamed(AppRoutes.login);                  },
                  child: Text(
                    "Begin Your Journey",
                    style: TextStyle(
                      color: Color(0xFF0B3A75),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            
          ],
        )
      ),
    );
  }
}