import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomFeatures extends StatelessWidget {
  const BottomFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Text(
                "OyL - Own Your Leased Car",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Experience the Best of Both Worlds",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade900,
                ),
              ),
            ],
          ),
        ),

        _card(
          Icons.attach_money,
          "No Additional Cost",
          "Why rent a car when you can own your leased (OyL) car with absolutely no additional cost? Get the benefits of ownership without the premium.",
        ),
        _card(
          Icons.auto_awesome,
          "Ultimate Luxury of Ownership",
          "Without compromising on any conveniences of a leased car, OyL gives you the ultimate luxury of owning a car from day one of your lease period.",
        ),
        _card(
          Icons.build,
          "Full Vehicle Lifecycle Management",
          "We handle everything from procurement, insurance, passing & registration, service & repairs, to managing accidents.",
        ),
        _card(
          Icons.directions_car,
          "Budget-Friendly Options",
          "Decide your budget and start browsing our extensive collection of vehicles.",
        ),
      ],
    );
  }

  Widget _card(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade900, width: 1.5),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade900,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}




class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        Text(
          "How It Works",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Your journey to ownership in 4 simple steps",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),

        const SizedBox(height: 20),

        _stepCard(
          1,
          Icons.calendar_today,
          "Inspect & Reserve",
          "Reserve a time slot through our app/website. After inspection, confirm and reserve by making the initial payment.",
        ),

        _stepCard(
          2,
          Icons.description,
          "Submit Documents",
          "Submit bank statement and employment details for vehicle finance. We'll assist with quotations and required details.",
        ),

        _stepCard(
          3,
          Icons.shield,
          "Loan Approval",
          "Once approved and LPO issued, OyL registers the vehicle under your name with full insurance.",
        ),

        _lastStep(),
      ],
    );
  }

  Widget _stepCard(int step, IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + Number
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Icon(icon, color: Colors.blue.shade900),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.blue.shade900,
                  child: Text(
                    "$step",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 15),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(desc),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _lastStep() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.blue.shade900,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white24,
              child: const Icon(Icons.directions_car, color: Colors.white),
            ),
            const Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Text(
                  "4",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),

        // 🔥 FIX HERE
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Drive Your Vehicle",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "You are FREE TO DRIVE YOUR OWN VEHICLE!",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
}


class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0B3A6E), // dark blue
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 Contact Us
          const Text(
            "Contact Us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          _contactItem(Icons.phone, "+971 50 453 4132"),
          _contactItem(Icons.email, "info@aurinhubb.com"),
          _contactItem(Icons.location_on, "Dubai, United Arab Emirates"),

          const SizedBox(height: 20),

          // 🔹 Links Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quick Links
              Expanded(
                child: _linkColumn("Quick Links", [
                  "Home",
                  "About Us",
                  "Browse Cars",
                  "FAQ",
                ]),
              ),

              const SizedBox(width: 20),

              // Legal
              Expanded(
                child: _linkColumn("Legal", [
                  "Terms & Conditions",
                  "Privacy Policy",
                  "Cookie Policy",
                  "Disclaimer",
                ]),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white30),

          const SizedBox(height: 20),

          // 🔹 Find Us + Buttons
          const Text(
            "Find Us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _socialIcon(Icons.camera_alt), // Instagram
              _socialIcon(Icons.facebook),
              _socialIcon(Icons.work), // LinkedIn
              _socialIcon(Icons.alternate_email), // Twitter
            ],
          ),

          const SizedBox(height: 15),

          // 🔹 App Buttons (simple version)
          _appButton("Download on the App Store"),
          const SizedBox(height: 10),
          _appButton("Get it on Google Play"),

          const SizedBox(height: 20),

          // 🔹 Bottom Text
          const Center(
            child: Column(
              children: [
                Text(
                  "© 2026 OyL Cars. All rights reserved.",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 5),
                Text(
                  "Designed with excellence for your dream car journey.",
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🔹 Contact Item
  Widget _contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }

  // 🔹 Link Column
  Widget _linkColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...links.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              e,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        )
      ],
    );
  }

  // 🔹 Social Icon
  Widget _socialIcon(IconData icon) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white24,
      child: Icon(icon, color: Colors.white),
    );
  }

  // 🔹 App Button
  Widget _appButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}