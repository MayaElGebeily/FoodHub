import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_apps/bnb.dart';

import '../UserController.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      bottomNavigationBar: const bnb(currentIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with Profile Image
            Container(
              height: 170,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFEA47), Color(0xFFFF8242)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20), // Left Padding
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage('assets/Cannoli.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Space between image and text
                  Obx(() => Text(
                    'Welcome, ${userController.fullName.value}!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik',
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 30), // Space below header
            _profileOptions('Rewards', () {}, FontAwesomeIcons.gift),
            _profileOptions('Your Orders', () {}, FontAwesomeIcons.receipt),
            _profileOptions('Credit Balance', () {}, FontAwesomeIcons.wallet),
            _profileOptions('Refer A Friend', () {}, FontAwesomeIcons.handshake),
            _profileOptions('Vouchers', () {}, FontAwesomeIcons.ticket),
            _profileOptions('Get Help', () {}, FontAwesomeIcons.circleQuestion),
            _profileOptions('About App', () {}, FontAwesomeIcons.circleInfo),
            _profileOptions('Logout', _handleLogout, FontAwesomeIcons.rightFromBracket),
          ],
        ),
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                try {
                  await FirebaseAuth.instance.signOut();
                  // Navigate to login screen after logout
                  Navigator.pushReplacementNamed(context, "/login");
                } catch (e) {
                  if (kDebugMode) {
                    print("Error signing out: $e");
                  }
                }
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _profileOptions(String label, VoidCallback onTap, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adds spacing
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            FaIcon(icon, size: 22, color: Colors.black), // Set color for better visibility
            const SizedBox(width: 15), // Space between icon and text
            Expanded( // Prevents text from overflowing
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
