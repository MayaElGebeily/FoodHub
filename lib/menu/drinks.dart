import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_apps/bnb.dart';

import '../aid/items.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});
  @override
  _DrinksState createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Items(
              name: 'Soft Drinks',
              description1: 'A variety of soft drinks, including',
              description2: 'Coca-Cola, Pepsi, and Sprite',
              description3: '',
              imagePath: 'assets/SoftDrinks.jpeg',
              price: 20,
              onTap: () {},
            ),

            Items(
              name: 'Fresh Juice',
              description1: 'Freshly squeezed juice made from',
              description2: 'a variety of fruits, including orange,',
              description3: 'apple, and mango',
              imagePath: 'assets/FreshJuice.jpeg',
              price: 30,
              onTap: () {},
            ),

            Items(
              name: 'Iced Tea',
              description1: 'A refreshing glass of iced tea,',
              description2: 'available in a variety of flavors,',
              description3: 'including lemon, peach, and mint',
              imagePath: 'assets/IcedTea.jpeg',
              price: 25,
              onTap: () {},
            ),

            Items(
              name: 'Coffee',
              description1: 'A hot cup of coffee, made from',
              description2: 'high-quality Arabica beans',
              description3: '',
              imagePath: 'assets/Coffee.jpeg',
              price: 20,
              onTap: () {},
            ),

            Items(
              name: 'Hot Chocolate',
              description1: 'A rich and creamy cup of hot',
              description2: 'chocolate, made with high-quality',
              description3: 'cocoa powder',
              imagePath: 'assets/HotChocolate.jpeg',
              price: 25,
              onTap: () {},
            ),

            Items(
              name: 'Milkshakes',
              description1: 'A thick and creamy milkshake,',
              description2: 'available in a variety of flavors,',
              description3: 'including chocolate, strawberry, and vanilla',
              imagePath: 'assets/Milkshakes.jpeg',
              price: 40,
              onTap: () {},
            ),

            Items(
              name: 'Smoothies',
              description1: 'A healthy and refreshing smoothie,',
              description2: 'made from a variety of fruits and',
              description3: 'yogurt',
              imagePath: 'assets/Smoothies.jpeg',
              price: 35,
              onTap: () {},
            ),

            Items(
              name: 'Fresh Lemonade',
              description1: 'A glass of freshly squeezed lemonade,',
              description2: 'made with real lemons and sugar',
              description3: '',
              imagePath: 'assets/FreshLemonade.jpeg',
              price: 25,
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const bnb(),
    );
  }
  }