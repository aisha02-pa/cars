import 'package:get/get.dart';
import 'package:oylcars/views/firstscreen_view.dart';
import 'package:oylcars/views/home/home_view.dart';
import 'package:oylcars/views/login_view.dart';
import 'package:oylcars/views/signup_view.dart';


import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashView()),
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.signup, page: () => SignupView()),
        GetPage(name: AppRoutes.home, page: () =>  HomeView()),

  ];
}