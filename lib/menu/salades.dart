import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../aid/items.dart';
import '../bnb.dart';

class Salade extends StatefulWidget {
  const Salade({super.key});

  @override
  _SaladeState createState() => _SaladeState();
}

class _SaladeState extends State<Salade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          color: const Color.fromRGBO(58, 125, 68, 1),
        ),
      ),
    bottomNavigationBar: const bnb(),
    body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Items(
            name: 'Classic Green Salad',
            description1: 'Fresh mixed greens, cherry tomatoes,',
            description2: 'cucumber, and carrots, topped with',
            description3: 'croutons and your choice of dressing',
            imagePath: 'assets/salade.jpeg',
            price: 80,
            onTap: () {},
          ),
          Items(
            name: 'Caesar Salad',
            description1: 'Romaine lettuce, croutons, and parmesan',
            description2: 'cheese, tossed in a classic Caesar',
            description3: 'dressing',
            imagePath: 'assets/CaesarSalad.jpeg',
            price: 100,
            onTap: () {},
          ),
          Items(
            name: 'Greek Salad',
            description1: 'Mixed greens, feta cheese, olives,',
            description2: 'cucumber, and tomatoes, topped with',
            description3: 'a zesty Greek vinaigrette',
            imagePath: 'assets/GreekSalad.jpeg',
            price: 120,
            onTap: () {},
          ),
          Items(
            name: 'Spinach Salad',
            description1: 'Fresh baby spinach, cherry tomatoes,',
            description2: 'and crumbled feta cheese, topped with',
            description3: 'a light vinaigrette and scrambled eggs',
            imagePath: 'assets/SpinachSalad.jpeg',
            price: 90,
            onTap: () {},
          ),
          Items(
            name: 'Chicken Salad',
            description1: 'Mixed greens, grilled chicken, cherry',
            description2: 'tomatoes, and cucumber, topped with',
            description3: 'a creamy ranch dressing',
            imagePath: 'assets/ChickenSalad.jpeg',
            price: 140,
            onTap: () {},
          ),
          Items(
            name: 'Tuna Salad',
            description1: 'Mixed greens, canned tuna, cherry',
            description2: 'tomatoes, and cucumber, topped with',
            description3: 'a zesty lemon vinaigrette',
            imagePath: 'assets/TunaSalad.jpeg',
            price: 130,
            onTap: () {},
          ),
        ],
      ),
    ),

    );
  }
}