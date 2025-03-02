import 'dart:math'; // Import the Random class
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'aid/CheckoutProgress.dart';

class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  late int orderNumber;
  @override
  void initState() {
    super.initState();
    orderNumber = Random().nextInt(900000) + 100000; // Generates a 6-digit order number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckoutProgress(currentStep: 3),
            const SizedBox(height: 150,),
            const FaIcon(
              FontAwesomeIcons.checkCircle,
              color: Colors.orange,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Successful!',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your order number is #$orderNumber',
              style: const TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              'You will receive your order within 24 hours',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 150,),
            const Text(
              'We appreciate your order!',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),

              ),
                onPressed: () => Navigator.pushNamed(context,'/Home'),
                child: const Text('Go back to Home Page' , style: TextStyle(color: Colors.white , fontSize: 18 , fontFamily: 'Rubik'),) ),
          ],
        ),
      ),
    );
  }
}
