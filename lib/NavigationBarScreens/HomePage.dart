import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_apps/bnb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String query = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(padding: const EdgeInsets.all(30),
          child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child:Text("What Would You Like To Order ?" , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20 , fontFamily: 'Rubik' , color: Color.fromRGBO(51, 51, 21, 0.7),),),),
          const SizedBox(height: 19,),
          Container(padding: const EdgeInsets.all(30),decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),image: const DecorationImage(
            image: AssetImage('assets/food.jpeg'),fit: BoxFit.cover,
          ),),width: 600,height: 200,child:

          const Column(
            children: [
              Text('BREAKFAST' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w900 , fontSize: 40),),
              Text('GOOD DEALS' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 40),),
            ],
          ),
          ),
          const SizedBox(height: 20,),
          Stack(
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.5  // Adjust for thinner or thicker outline
                    ..color = const Color.fromRGBO(255,69,0, 1 ), // Outline color
                ),
              ),
              // White filled text
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontFamily: 'Rubik',
                  color: Color.fromRGBO(255,140,0,1), // Fill color
                ),
              ),
            ],
          ) ,
          const SizedBox(height: 20,),
          SingleChildScrollView(scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _options('Burgers', 'assets/burger.jpeg', () { Navigator.pushNamed(context, '/burger'); }),
                const SizedBox(width: 18,),
                _options('Pizzas', 'assets/pizza.jpeg', () {Navigator.pushNamed(context, '/pizza');}),
                const SizedBox(width: 18,),
                _options('Pastas', 'assets/pasta.jpeg', () {Navigator.pushNamed(context, '/pasta');}),
                const SizedBox(width: 18,),
                _options('Salads', 'assets/salade.jpeg', () {Navigator.pushNamed(context, '/salade');}),
                const SizedBox(width: 18,),
                _options('Dessert', 'assets/desserts.jpeg', () {Navigator.pushNamed(context, '/dessert');}),
                const SizedBox(width: 18,),
                _options('Drinks', 'assets/drinks.jpeg', () {Navigator.pushNamed(context, '/drinks');}),
                const SizedBox(width: 18,),

              ],),
          ),
          SizedBox(height: 25,),
          Align(
            alignment: FractionalOffset.centerLeft,
            child:
            Stack(
              children: [
                // Black outlined text
                Text(
                  'Deals Of The Day',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.5  // Adjust for thinner or thicker outline
                      ..color = const Color.fromRGBO(255,69,0, 1 ), // Outline color
                  ),
                ),
                // White filled text
                const Text(
                  'Deals Of The Day',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(255,140,0,1), // Fill color
                  ),
                ),
              ],
            )
            ,),
          const SizedBox(height: 5,),
          _dealsOfTheDay('Buy 1 Get 1 Free Pizza', 'assets/pizza_offers.jpeg', () {}, 'Valid For 2 months'),
          const SizedBox(height: 25,),
          _dealsOfTheDay('30% off on salads ', 'assets/Salade_offer.jpeg', () {}, 'Valid For 48 hours'),
          const SizedBox(height: 25,),
          _dealsOfTheDay('Dessert Special: Free Coffee', 'assets/dessertOffer.jpeg', () {}, 'EveryDay till 12 pm'),

        ],
      ),),),
      bottomNavigationBar: const bnb(currentIndex: 0),
    );
  }
  Widget _options(String title , String imagePath , VoidCallback onTap ){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomLeft,
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover, // Ensures the image covers the container completely
          ),
        ),
        child:
        Stack(
          children: [
            // Black outlined text
            Text(
              title,
              style: TextStyle(
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(1), // Subtle black shadow
                      offset: const Offset(4, 4), // Slightly offset for depth effect
                      blurRadius: 3),],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.5  // Adjust for thinner or thicker outline
                  ..color = Colors.black, // Outline color
              ),
            ),
            // White filled text
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
                color: Colors.white, // Fill color
              ),
            ),
          ],
        )
        ,
      ),
    );
  }
  Widget _dealsOfTheDay(String title, String imagePath, VoidCallback onTap, String duration) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 150, // Set height explicitly to prevent overflow
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Black outlined text
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2  // Adjust for thinner or thicker outline
                      ..color = Colors.black, // Outline color
                  ),
                ),
                // White filled text
                Text(
                  title,
                  style: TextStyle(
                     shadows: [
                       Shadow(
                         color: Colors.black.withOpacity(1), // Subtle black shadow
                         offset: const Offset(4, 4), // Slightly offset for depth effect
                         blurRadius: 1),],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                    color: Colors.white, // Fill color
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                // Black outlined text
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.5  // Adjust for thinner or thicker outline
                      ..color = Colors.black, // Outline color
                  ),
                ),
                // White filled text
                Text(
                  duration,
                  style:TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(1), // Subtle black shadow
                        offset: const Offset(4, 4), // Slightly offset for depth effect
                        blurRadius: 1),],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                    color: Colors.grey, // Fill color
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}