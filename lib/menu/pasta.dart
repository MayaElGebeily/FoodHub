import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_apps/bnb.dart';

import '../aid/items.dart';

class Pasta extends StatefulWidget {
  @override
  _PastaState createState() => _PastaState();
}

class _PastaState extends State<Pasta> {
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
            name: 'Spaghetti Bolognese',
            description1: 'A classic Italian dish',
            description2: 'featuring spaghetti tossed in a rich',
            description3: 'beef bolognese sauce, topped with parmesan cheese',
            imagePath: 'assets/SpaghettiBolognese.jpeg',
            price: 120,
            onTap: () {},
          ),

          Items(
            name: 'Fettuccine Alfredo',
            description1: 'Creamy fettuccine pasta',
            description2: 'tossed in a rich and creamy',
            description3: 'Alfredo sauce, topped with parmesan cheese',
            imagePath: 'assets/FettuccineAlfredo.jpeg',
            price: 140,
            onTap: () {},
          ),

          Items(
            name: 'Lasagna',
            description1: 'Layers of pasta, meat sauce,',
            description2: 'and mozzarella cheese baked',
            description3: 'to perfection',
            imagePath: 'assets/pasta.jpeg',
            price: 160,
            onTap: () {},
          ),

          Items(
            name: 'Mac \'n Cheese',
            description1: 'A comforting macaroni pasta',
            description2: 'baked in a creamy cheese',
            description3: 'sauce',
            imagePath: 'assets/MacNCheese.jpeg',
            price: 100,
            onTap: () {},
          ),

          Items(
            name: 'Spaghetti Aglio e Olio',
            description1: 'Spaghetti tossed in a light',
            description2: 'and flavorful garlic and',
            description3: 'olive oil sauce, topped with red pepper flakes',
            imagePath: 'assets/SpaghettiAglioOlio.jpeg',
            price: 110,
            onTap: () {},
          ),

          Items(
            name: 'Penne Arrabiata',
            description1: 'Penne pasta tossed in a spicy',
            description2: 'tomato sauce, topped with',
            description3: 'parmesan cheese',
            imagePath: 'assets/PenneArrabiata.jpeg',
            price: 130,
            onTap: () {},
          ),

          Items(
            name: 'Ravioli',
            description1: 'Cheese-filled ravioli pasta',
            description2: 'served in a light and creamy',
            description3: 'sauce',
            imagePath: 'assets/Ravioli.jpeg',
            price: 150,
            onTap: () {},
          ),

          Items(
            name: 'Carbonara',
            description1: 'Spaghetti tossed in a rich',
            description2: 'and creamy bacon and egg',
            description3: 'sauce',
            imagePath: 'assets/Carbonara.jpeg',
            price: 140,
            onTap: () {},
          ),

          Items(
            name: 'Tortellini',
            description1: 'Cheese-filled tortellini pasta',
            description2: 'served in a light and creamy',
            description3: 'sauce',
            imagePath: 'assets/Tortellini.jpeg',
            price: 160,
            onTap: () {},
          ),
        ],
      ),
    ),);
  }
}