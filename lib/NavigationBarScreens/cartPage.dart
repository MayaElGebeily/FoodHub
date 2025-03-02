import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../aid/CheckoutProgress.dart';
import '../bnb.dart';
import 'cart.dart';

class CartPage extends StatefulWidget {
  static List<CartItem> cartItems = [];
  static double totalCartPrice = 0.0;

  CartPage({super.key,
    List<CartItem> cartItems = const [],
    double totalCartPrice = 0.0,
  }) {
    CartPage.cartItems = cartItems;
    CartPage.totalCartPrice = totalCartPrice;
  }

  static void addItemToCart(CartItem item) {
    cartItems.add(item);
    totalCartPrice += item.totalPrice;
  }
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeItemFromCart(int index) {
    setState(() {
      CartPage.totalCartPrice -= CartPage.cartItems[index].totalPrice;
      CartPage.cartItems.removeAt(index);
    });
  }
  void clearCart() {
    setState(() {
      CartPage.cartItems.clear();
      CartPage.totalCartPrice = 0.0;
    });
  }
  void next_button(){
    CartPage.cartItems;
    CartPage.totalCartPrice;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Your Cart' , style: TextStyle(fontWeight: FontWeight.bold , fontFamily: 'Rubik'),),),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      bottomNavigationBar: const bnb(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckoutProgress(currentStep: 0),
            Expanded(
              child: ListView.builder(
                itemCount: CartPage.cartItems.length,
                itemBuilder: (context, index) {
                  final item = CartPage.cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        'Qty: ${item.quantity} ',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Text(
                        'Price: ${item.price} EGP\nTotal: ${item.totalPrice.toStringAsFixed(2)} EGP',
                        style:const TextStyle(fontFamily: 'Rubik') ,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          removeItemFromCart(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Price: ${CartPage.totalCartPrice.toStringAsFixed(2)} EGP',
              style: const TextStyle(
                fontFamily: 'Rubik',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: CartPage.cartItems.isEmpty ? null : clearCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16 , fontFamily: 'Rubik'),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Small gap between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: CartPage.cartItems.isEmpty ? null : () {
                      Navigator.pushNamed(context, '/visa');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Rubik'),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
