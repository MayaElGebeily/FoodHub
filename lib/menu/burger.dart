import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_apps/aid/items.dart';
import 'package:my_apps/bnb.dart';

class burger extends StatefulWidget {
  const burger({super.key});
  @override
  _burgerState createState() => _burgerState();
}

class _burgerState extends State<burger> {
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
    bottomNavigationBar: bnb(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Items(
              name: 'Classic Cheeseburger',
              description1: 'A classic burger featuring a juicy beef patty,',
              description2: 'melted cheddar cheese, crispy lettuce, tomato, onion,',
              description3: 'and our signature sauce, all served on a toasted bun.',
              price: 149, imagePath: 'assets/ClassicCheeseburger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Bacon BBQ Burger',
              description1: 'A savory burger topped with crispy bacon,',
              description2: 'melted cheddar cheese, BBQ sauce, lettuce, tomato,',
              description3: 'and onion, all served on a toasted bun.',
              price: 179,
              imagePath: 'assets/BaconBBQBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Mushroom Swiss Burger',
              description1: 'A flavorful burger featuring a beef patty topped with',
              description2: 'sautéed mushrooms, melted Swiss cheese, lettuce, tomato,',
              description3: 'and our signature sauce, all served on a toasted bun.',
              price: 169,
              imagePath: 'assets/MushroomSwissBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Spicy Texan Burger',
              description1: 'A spicy burger featuring a beef patty topped with',
              description2: 'crispy bacon, melted pepper jack cheese, jalapeños,',
              description3: 'lettuce, tomato, and our signature sauce, all served on a toasted bun.',
              price: 189, imagePath: 'assets/SpicyTexanBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Veggie Burger',
              description1: 'A vegetarian burger featuring a black bean patty',
              description2: 'topped with avocado, lettuce, tomato, and our signature sauce,',
              description3: 'all served on a toasted bun.',
              price: 139, imagePath: 'assets/VeggieBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Greek Feta Burger',
              description1: 'A Mediterranean-inspired burger featuring a beef patty',
              description2: 'topped with feta cheese, olives, lettuce, tomato, and',
              description3: 'a tangy tzatziki sauce, all served on a toasted bun.',
              price: 159,
              imagePath: 'assets/GreekFetaBurgers.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Italian Burger',
              description1: 'A flavorful burger featuring a beef patty topped with',
              description2: 'marinara sauce, melted mozzarella cheese, pepperoni slices,',
              description3: 'lettuce, and tomato, all served on a toasted bun.',
              price: 169,
              imagePath: 'assets/ItalianBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Korean BBQ Burger',
              description1: 'A spicy burger featuring a beef patty topped with',
              description2: 'Korean-style BBQ sauce, crispy kimchi slaw, melted cheddar cheese,',
              description3: 'lettuce, and tomato, all served on a toasted bun.',
              price: 179,
              imagePath: 'assets/KoreanBBQBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Mexican Burger',
              description1: 'A south-of-the-border-inspired burger featuring a beef patty',
              description2: 'topped with salsa, avocado, pepper jack cheese, lettuce,',
              description3: 'and tomato, all served on a toasted bun.',
              price: 159,
              imagePath: 'assets/MexicanBurger.jpeg',
              onTap: () {}, ),

            Items(
              name: 'Portobello Mushroom Burger',
              description1: 'A gourmet burger featuring a grilled Portobello mushroom cap',
              description2: 'topped with melted Swiss cheese, caramelized onions, lettuce,',
              description3: 'and tomato, all served on a toasted bun.', price: 189,
              imagePath: 'assets/PortobelloMushroomBurger.jpeg',
              onTap: () {}, ),
          ],
        ) ,
      ),
    );

  }
  }