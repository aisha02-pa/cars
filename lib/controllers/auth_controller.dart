import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oylcars/services/api_services.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final authapiservices = ApiService();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final whatsappController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  var isLoading = false.obs;
  var isSameNumber = false.obs;

  VoidCallback? _contactListener;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void toggleSameNumber(bool? value) {
    isSameNumber.value = value ?? false;

    if (isSameNumber.value) {
      whatsappController.text = contactController.text;

      // remove old listener if exists
      if (_contactListener != null) {
        contactController.removeListener(_contactListener!);
      }

      _contactListener = () {
        if (isSameNumber.value) {
          whatsappController.text = contactController.text;
        }
      };

      contactController.addListener(_contactListener!);
    } else {
      whatsappController.clear();

      if (_contactListener != null) {
        contactController.removeListener(_contactListener!);
      }
    }
  }

  // ================= VALIDATION =================

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return "Name is required";
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!GetUtils.isEmail(value)) return "Enter valid email";
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Phone number required";
    if (value.length < 10) return "Enter valid number";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password required";
    if (value.length < 8) return "Minimum 8 characters";
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return "Confirm your password";
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  // ================= LOCAL SIGNUP =================



  Future<void> signup(
    String name,
    String email,
    String phone,
    String password,
    String whatsapp
  ) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      // await Future.delayed(const Duration(seconds: 2));
      var response = ApiService.signup(
        name: name,
        email: email,
        phone: phone,
        password: password,
        whatsapp: whatsapp
      );

      Get.snackbar("Success", "Account created successfully");

      // Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  // ================= LOCAL LOGIN =================

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2)); // fake loading

      Get.snackbar("Success", "Login Successful");

      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    if (_contactListener != null) {
      contactController.removeListener(_contactListener!);
    }

    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    whatsappController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}