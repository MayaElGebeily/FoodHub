import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_apps/aid/items.dart';
import 'package:my_apps/bnb.dart';

class Pizza extends StatefulWidget {
  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
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
              name: ' Margherita Pizza' ,
              description1: 'A classic Neapolitan-style pizza',
              description2: 'topped with fresh tomatoes',
              description3: ', mozzarella cheese, and basil leaves',
              imagePath: 'assets/Margerita.jpeg',
              price: 199,
              onTap: () {},),
            Items(
              name: 'Hawaiian Pizza',
              description1: 'A sweet and savory pizza',
              description2: 'topped with ham and pineapple',
              description3: '',
              imagePath: 'assets/Hawaiian Pizza.jpeg',
              price: 249,
              onTap: () {},),
            Items(
              name: 'Meat Lover Pizza',
              description1: 'A hearty pizza loaded ',
              description2: 'with pepperoni, sausage, bacon',
              description3: '',
              imagePath: 'assets/meatLovers.jpeg',
              price: 349,
              onTap: () {},),
            Items(
              name: 'Veggie Delight Pizza',
              description1: 'A vegetarian dream pizza ',
              description2: 'topped with mushrooms, onions,',
              description3: 'bell peppers, and olives',
              imagePath: 'assets/Veggie.jpeg',
              price: 229,
              onTap: () {},),
            Items(
              name: 'BBQ Chicken Pizza',
              description1: 'A tangy and savory pizza ',
              description2: 'topped with grilled chicken',
              description3: 'barbecue sauce, and red onion.',
              imagePath: 'assets/BBQChicken.jpeg',
              price: 269,
              onTap: () {},),
            Items(
              name: 'Quattro Formaggi Pizza',
              description1: 'A cheese lover dream pizza ',
              description2: 'topped with four different types of cheese',
              description3: 'mozzarella, parmesan, gorgonzola, and ricotta..',
              imagePath: 'assets/QuattroFormaggi.jpeg',
              price: 329,
              onTap: () {},),
            Items(
              name: 'Shrimp Scampi Pizza',
              description1: 'A seafood-inspired pizza  ',
              description2: 'topped with shrimp, garlic, and parsley.',
              description3: '',
              imagePath: 'assets/ShrimpScampi.jpeg',
              price: 399,
              onTap: () {},),
            Items(
              name: 'Mediterranean Pizza',
              description1: 'A flavorful pizza',
              description2: 'topped with feta cheese, kalamata olives',
              description3: ',artichoke hearts, and sun-dried tomatoes',
              imagePath: 'assets/Mediterranean.jpeg',
              price: 299,
              onTap: () {},),
            Items(
              name: 'Spicy Italian Pizza',
              description1: 'A spicy pizza topped',
              description2: ' with pepperoni, jalapeños, and banana peppers',
              description3: '',
              imagePath: 'assets/SpicyItalian.jpeg',
              price: 259,
              onTap: () {},),
            Items(
              name: 'White Pizza',
              description1: 'A creamy pizza',
              description2: 'topped with ricotta cheese, garlic, and spinach',
              description3: '',
              imagePath: 'assets/WhitePizza.jpeg',
              price: 219,
              onTap: () {},),
          ],
        ),
      ),
    );
  }
}

