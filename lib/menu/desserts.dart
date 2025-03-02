import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_apps/bnb.dart';

import '../aid/items.dart';

class Desserts extends StatefulWidget {
  const Desserts({super.key});
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Desserts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
              name: 'Tiramisu',
              description1: 'Ladyfingers soaked in coffee and liqueur,',
              description2: 'layered with mascarpone cheese and cocoa powder',
              description3: '',
              imagePath: 'assets/Tiramisu.jpeg',
              price: 80,
              onTap: () {},
            ),

            Items(
              name: 'Cheesecake',
              description1: 'Creamy cheesecake with a graham cracker crust,',
              description2: 'topped with a mixed berry compote',
              description3: '',
              imagePath: 'assets/Cheesecake.jpeg',
              price: 100,
              onTap: () {},
            ),

            Items(
              name: 'Chocolate Lava Cake',
              description1: 'Warm chocolate cake filled with a rich,',
              description2: 'molten chocolate center, served with vanilla ice cream',
              description3: '',
              imagePath: 'assets/ChocolateLavaCake.jpeg',
              price: 120,
              onTap: () {},
            ),

            Items(
              name: 'Cannoli',
              description1: 'Fried pastry shells filled with sweetened,',
              description2: 'ricotta cheese and chocolate chips',
              description3: '',
              imagePath: 'assets/Cannoli.jpeg',
              price: 90,
              onTap: () {},
            ),

            Items(
              name: 'Panna Cotta',
              description1: 'Creamy vanilla pudding topped with a mixed,',
              description2: 'berry compote and a sprinkle of sugar',
              description3: '',
              imagePath: 'assets/PannaCotta.jpeg',
              price: 80,
              onTap: () {},
            ),

            Items(
              name: 'Gelato',
              description1: 'Italian-style ice cream available in,',
              description2: 'a variety of flavors',
              description3: '',
              imagePath: 'assets/Gelato.jpeg',
              price: 60,
              onTap: () {},
            ),

            Items(
              name: 'Fruit Tart',
              description1: 'A sweet and tangy mix of fresh fruits,',
              description2: 'arranged on a bed of jam in a flaky pastry crust',
              description3: '',
              imagePath: 'assets/FruitTart.jpeg',
              price: 100,
              onTap: () {},
            ),

            Items(
              name: 'Creme Brûlée',
              description1: 'Rich vanilla custard base topped with a,',
              description2: 'layer of caramelized sugar',
              description3: '',
              imagePath: 'assets/CremeBrulee.jpeg',
              price: 120,
              onTap: () {},
            ),
          ],),
      ),
      bottomNavigationBar: const bnb(),
    );
  }

}