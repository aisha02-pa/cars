import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oylcars/controllers/auth_controller.dart';
import 'package:oylcars/routes/app_routes.dart';

class LoginView extends StatelessWidget {
   final AuthController controller = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B3A75),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: .centerLeft,
                    child: Text("OYL CARS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B3A75)
                    ),),
                  ),
                   SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome Back",
                        style: TextStyle(
                           color: Color(0xFF0B3A75), fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                    Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Login to your account",
                        style: TextStyle(color: Colors.grey)),
                  ),

                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),

                  SizedBox(height: 15),
                   Obx(() => TextField(
                        controller: passwordController,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: controller.togglePassword,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      )),

                      SizedBox(height: 10,),
                       Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forgot Password?",
                        style: TextStyle(color: Color(0xFF0B3A75))),
                  ),
                  SizedBox(height: 20,),

                  Obx(() => SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  controller.login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: controller.isLoading.value
                              ? CircularProgressIndicator()
                              : Text("Login",
                                  style: TextStyle(color: Color(0xFF0B3A75))),
                        ),
                      )),

                  SizedBox(height: 20),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.signup);
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Color(0xFF0B3A75),
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ],
              ),
              
            ),
          ),
        )),
    );
  }
}