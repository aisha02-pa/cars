import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oylcars/routes/app_routes.dart';
import '../controllers/auth_controller.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final blue = Colors.blue.shade900;

    // 🔥 Common textbox style
    InputDecoration boxDecoration(String label, IconData icon) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: blue),
        prefixIcon: Icon(icon, color: blue),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: blue),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: blue, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      );
    }

    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OYL CARS",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Name
                  TextFormField(
                    controller: controller.nameController,
                    validator: controller.validateName,
                    style: TextStyle(color: blue),
                    decoration: boxDecoration("Full Name", Icons.person),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Email
                  TextFormField(
                    controller: controller.emailController,
                    validator: controller.validateEmail,
                    style: TextStyle(color: blue),
                    decoration: boxDecoration("Email Address", Icons.email),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Contact
                  TextFormField(
                    controller: controller.contactController,
                    validator: controller.validatePhone,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: blue),
                    decoration: boxDecoration("Contact Number", Icons.phone),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 WhatsApp
                  TextFormField(
                    controller: controller.whatsappController,
                    validator: controller.validatePhone,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: blue),
                    decoration: boxDecoration("WhatsApp Number", Icons.message),
                  ),

                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isSameNumber.value,
                          onChanged: controller.toggleSameNumber,
                          activeColor: blue,
                        ),
                      ),
                      Text(
                        "Same as contact number",
                        style: TextStyle(color: blue),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Password
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      validator: controller.validatePassword,
                      style: TextStyle(color: blue),
                      decoration: boxDecoration("Password", Icons.lock)
                          .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: blue,
                              ),
                              onPressed: controller.togglePassword,
                            ),
                          ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Confirm Password
                  Obx(
                    () => TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isConfirmPasswordHidden.value,
                      validator: controller.validateConfirmPassword,
                      style: TextStyle(color: blue),
                      decoration: boxDecoration("Confirm Password", Icons.lock)
                          .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isConfirmPasswordHidden.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: blue,
                              ),
                              onPressed: controller.toggleConfirmPassword,
                            ),
                          ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 🔹 Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        controller.signup(
                          controller.nameController.text.trim(),
                          controller.emailController.text.trim(),
                          controller.contactController.text.trim(),
                          controller.passwordController.text.trim(),

                          controller.whatsappController.text.trim(),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(color: blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:oylcars/routes/app_routes.dart';
// import '../controllers/auth_controller.dart';

// class SignupView extends StatelessWidget {
//   SignupView({super.key});

//   final AuthController controller = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     final blue = Colors.blue.shade900;

//     InputDecoration boxDecoration(String label, IconData icon) {
//       return InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: blue),
//         prefixIcon: Icon(icon, color: blue),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: blue),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: blue, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.red),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.red, width: 2),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: blue,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Form(
//               key: controller.formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "OYL CARS",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: blue,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "Create Account",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: blue,
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // 🔹 Name
//                   TextFormField(
//                     controller: controller.nameController,
//                     validator: controller.validateName,
//                     style: TextStyle(color: blue),
//                     decoration: boxDecoration("Full Name", Icons.person),
//                   ),

//                   const SizedBox(height: 15),

//                   // 🔹 Email
//                   TextFormField(
//                     controller: controller.emailController,
//                     validator: controller.validateEmail,
//                     style: TextStyle(color: blue),
//                     decoration: boxDecoration("Email Address", Icons.email),
//                   ),

//                   const SizedBox(height: 15),

//                   // 🔹 Contact
//                   TextFormField(
//                     controller: controller.contactController,
//                     validator: controller.validatePhone,
//                     keyboardType: TextInputType.phone,
//                     style: TextStyle(color: blue),
//                     decoration:
//                         boxDecoration("Contact Number", Icons.phone),
//                   ),

//                   const SizedBox(height: 15),

//                   // 🔹 WhatsApp
//                   TextFormField(
//                     controller: controller.whatsappController,
//                     validator: controller.validatePhone,
//                     keyboardType: TextInputType.phone,
//                     style: TextStyle(color: blue),
//                     decoration:
//                         boxDecoration("WhatsApp Number", Icons.message),
//                   ),

//                   // 🔹 Same number checkbox
//                   Row(
//                     children: [
//                       Obx(() => Checkbox(
//                             value: controller.isSameNumber.value,
//                             onChanged: controller.toggleSameNumber,
//                             activeColor: blue,
//                           )),
//                       Text(
//                         "Same as contact number",
//                         style: TextStyle(color: blue),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 15),

//                   // 🔹 Password
//                   Obx(() => TextFormField(
//                         controller: controller.passwordController,
//                         obscureText: controller.isPasswordHidden.value,
//                         validator: controller.validatePassword,
//                         style: TextStyle(color: blue),
//                         decoration:
//                             boxDecoration("Password", Icons.lock).copyWith(
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               controller.isPasswordHidden.value
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: blue,
//                             ),
//                             onPressed: controller.togglePassword,
//                           ),
//                         ),
//                       )),

//                   const SizedBox(height: 15),

//                   // 🔹 Confirm Password
//                   Obx(() => TextFormField(
//                         controller:
//                             controller.confirmPasswordController,
//                         obscureText:
//                             controller.isConfirmPasswordHidden.value,
//                         validator:
//                             controller.validateConfirmPassword,
//                         style: TextStyle(color: blue),
//                         decoration: boxDecoration(
//                                 "Confirm Password", Icons.lock)
//                             .copyWith(
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               controller.isConfirmPasswordHidden.value
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: blue,
//                             ),
//                             onPressed:
//                                 controller.toggleConfirmPassword,
//                           ),
//                         ),
//                       )),

//                   const SizedBox(height: 25),

//                   // 🔹 Sign Up Button (NO API)
//                   SizedBox(
//                     width: double.infinity,
//                     child: Obx(() => ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: blue,
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 14),
//                           ),
//                           onPressed: controller.isLoading.value
//                               ? null
//                               : () {
//                                   controller.signup();
//                                 },
//                           child: controller.isLoading.value
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                               : const Text(
//                                   "Sign Up",
//                                   style:
//                                       TextStyle(color: Colors.white),
//                                 ),
//                         )),
//                   ),

//                   const SizedBox(height: 10),

//                   // 🔹 Login navigation
//                   Center(
//                     child: TextButton(
//                       onPressed: () {
//                         Get.toNamed(AppRoutes.login);
//                       },
//                       child: Text(
//                         "Already have an account? Login",
//                         style: TextStyle(color: blue),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }