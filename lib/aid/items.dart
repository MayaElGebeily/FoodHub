import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../NavigationBarScreens/cart.dart';
import '../NavigationBarScreens/cartPage.dart';

class Items extends StatefulWidget {
  final String name;
  final String description1;
  final String description2;
  final String description3;
  final String imagePath;
  final double price;
  VoidCallback onTap;

  Items({
    required this.name,
    required this.description1,
    required this.description2,
    required this.description3,
    required this.imagePath,
    required this.price,
    required this.onTap,
  });

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  int _counter = 0;
  double _totalPrice = 0;
  bool _showFullDescription = false;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _addToCart() {
    setState(() {
      _totalPrice = widget.price * _counter;
    });
    if (_counter > 0) {
      CartPage.addItemToCart(
        CartItem(
          name: widget.name,
          quantity: _counter,
          price: widget.price,
          totalPrice: _totalPrice,
        ),
      );
    }

    String snackBarMessage = _counter == 0
        ? 'Nothing Added in cart'
        : '$_counter item(s) added! Total: EGP $_totalPrice';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(
              child: Text(
                snackBarMessage,
                style: const TextStyle(fontFamily: 'Rubik'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      cartItems: CartPage.cartItems,
                      totalCartPrice: CartPage.totalCartPrice,
                    ),
                  ),
                );
              },
              child: const Text('View Cart'),
            )
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(101, 69, 32, 1),
                        fontFamily: 'Rubik',
                      ),
                    ),
                    Text(
                      _showFullDescription
                          ? "${widget.description1} ${widget.description2} ${widget.description3}"
                          : "${widget.description1}...",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(31, 69, 41, 1),
                        fontFamily: 'Rubik',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showFullDescription = !_showFullDescription;
                        });
                      },
                      child: Text(
                        _showFullDescription ? "Show Less" : "Show More",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Text(
                '${widget.price.toStringAsFixed(2)} EGP',
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(31, 69, 41, 1),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: _decrement,
                      icon: const FaIcon(
                        FontAwesomeIcons.minus,
                        color: Colors.orange,
                        size: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$_counter',
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: Color.fromRGBO(31, 69, 41, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 30,
                    width: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.orange,
                    ),
                    child: IconButton(
                      onPressed: _increment,
                      icon: const FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _counter > 0 ? _addToCart : null, // Disable button if _counter is 0
                style: ElevatedButton.styleFrom(
                  backgroundColor: _counter > 0 ? Colors.green : Colors.grey, // Change color dynamically
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
