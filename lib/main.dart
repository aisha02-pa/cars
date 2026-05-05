import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oylcars/routes/app_routes.dart';
import 'package:oylcars/views/firstscreen_view.dart';
import 'package:oylcars/views/home/home_view.dart';
import 'package:oylcars/views/login_view.dart';
import 'package:oylcars/views/signup_view.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized(); 
   await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,

      getPages: [
        GetPage(name: AppRoutes.splash, page: () => SplashView()),
        GetPage(name: AppRoutes.login, page: () => LoginView()),
        GetPage(name: AppRoutes.signup, page: () => SignupView()),

        GetPage(name: AppRoutes.home, page: () =>  HomeView()),
      ],
    );
  }
}
