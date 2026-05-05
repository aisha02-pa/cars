import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oylcars/views/home/widgets/bottom_features.dart';
import 'package:oylcars/views/home/widgets/car_list.dart';
import 'package:oylcars/views/home/widgets/core_values.dart';
import '../../controllers/home_controller.dart';

import 'widgets/header_section.dart';
import 'widgets/intro_section.dart';
import 'widgets/search_section.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());
  final sectionKeys = {
  "what": GlobalKey(),
  "how": GlobalKey(),
  "cars": GlobalKey(),
  "contact": GlobalKey(),
};

void scrollTo(GlobalKey key) {
  final ctx = key.currentContext;
  if (ctx != null) {
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  drawer: Drawer(
  child: Container(
    color: const Color(0xFF0B3A75),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/logoheaderoyl.png",
                height: 40,
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 20),

        _menuItem("What We Do", () {
          Navigator.pop(context);
          scrollTo(sectionKeys["what"]!);
        }),

        _menuItem("How It Works", () {
          Navigator.pop(context);
          scrollTo(sectionKeys["how"]!);
        }),

        _menuItem("Browse Cars", () {
          Navigator.pop(context);
          scrollTo(sectionKeys["cars"]!);
        }),

        _menuItem("Contact", () {
          Navigator.pop(context);
          scrollTo(sectionKeys["contact"]!);
        }),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          color: Colors.white10,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: const Text(
            "Favorites",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),

        _menuItem("Login", () {
          Navigator.pop(context);
          // TODO: navigate to login
        }),

        const Spacer(),

        const Center(
          child: Text(
            "DOWNLOAD APP",
            style: TextStyle(
              color: Colors.white70,
              letterSpacing: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: _appButton(Icons.apple, "iOS")),
              const SizedBox(width: 10),
              Expanded(child: _appButton(Icons.android, "Android")),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    ),
  ),
),

  body: SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [

          HeaderSection(),

          Container(
            key: sectionKeys["what"],
            child: IntroSection(),
          ),

          CoreValuesSection(),
          SearchSection(),

          Container(
            key: sectionKeys["cars"],
            child: CarListSection(),
          ),

          BottomFeatures(),

          Container(
            key: sectionKeys["how"],
            child: HowItWorks(),
          ),

          Container(
            key: sectionKeys["contact"],
            child: FooterSection(),
          ),
        ],
      ),
    ),
  ),
);
  }
}
  Widget _item(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    onTap: onTap,
  );
}

Widget _menuItem(String title, VoidCallback onTap) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.white24,
      highlightColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

Widget _appButton(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white24),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}