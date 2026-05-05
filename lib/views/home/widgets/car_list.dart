import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oylcars/controllers/home_controller.dart';
import 'car_card.dart';

class CarListSection extends StatelessWidget {
  const CarListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.carList.length,
        itemBuilder: (context, index) {
          return CarCard(car: controller.carList[index]);
        },
      );
    });
  }
}