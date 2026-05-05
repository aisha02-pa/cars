import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oylcars/views/home/widgets/car_list.dart';
import 'package:oylcars/views/home/widgets/core_values.dart';
import '../../controllers/home_controller.dart';

import 'widgets/header_section.dart';
import 'widgets/intro_section.dart';
import 'widgets/search_section.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [

              HeaderSection(),
              IntroSection(),
              CoreValuesSection(),
              SearchSection(),
              CarListSection(),

            ],
          ),
        ),
      ),
    );
  }
}