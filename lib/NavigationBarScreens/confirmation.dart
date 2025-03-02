import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_apps/aid/CheckoutProgress.dart';

import '../aid/customedBG.dart';
import 'cartPage.dart';
class Confirmation extends StatelessWidget {
  final String buildingNumber;
  final String floorNumber;
  final String apartmentNumber;
  final String districtName;
  final String compoundName;

  const Confirmation({
    super.key,
    required this.buildingNumber,
    required this.floorNumber,
    required this.apartmentNumber,
    required this.districtName,
    required this.compoundName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CheckoutProgress(currentStep: 2),
                  const SizedBox(height: 40,),
                  Container(
                    width: 500,
                    height: 450,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(194, 194, 194, 0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const Text('Order Summary :', style: TextStyle(fontFamily: 'Rubik' , fontWeight: FontWeight.bold , fontSize: 23),),
                        const SizedBox(height: 20,),
                        ...CartPage.cartItems.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "${item.quantity}x ${item.name} - ${item.totalPrice.toStringAsFixed(2)} EGP ",
                            style: const TextStyle(fontSize: 16 , fontFamily: 'Rubik' , color: Colors.grey),
                          ),
                        )),
                        const SizedBox(height: 30,),
                        Text(
                          "Total Price : ${CartPage.totalCartPrice} EGP",
                          style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Rubik'),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          "Compound Name : $compoundName",
                          style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Rubik'),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          "District Name : $districtName",
                          style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Rubik'),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          "Building Number : $buildingNumber",
                          style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Rubik'),
                        ),
                        const SizedBox(height: 18),
                        if (floorNumber.isNotEmpty)
                          Text(
                            "Floor Number : $floorNumber",
                            style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Rubik'),
                          ),

                        const SizedBox(height: 18),

                        // **Conditionally Display Apartment Number**
                        if (apartmentNumber.isNotEmpty)
                          Text(
                            "Apartment Number : $apartmentNumber",
                            style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Rubik'),
                          ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:Colors.red, // Button background color
                                  foregroundColor: Colors.white, // Text/icon color
                                  elevation: 4, // Shadow depth
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8), // Rounded corners
                                  ),
                                ),
                                onPressed:() => Navigator.pushNamed(context, '/visa'),
                                child: const Text('Back' , style: TextStyle(fontSize: 17 , fontFamily: 'Rubik'),),),
                            ),
                            SizedBox(
                              width: 150,
                              height: 35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:Colors.orange, // Button background color
                                  foregroundColor: Colors.white, // Text/icon color
                                  elevation: 4, // Shadow depth
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8), // Rounded corners
                                  ),
                                ),
                                onPressed:() => Navigator.pushNamed(context, '/congrats'),
                                child: const Text('Confirm' , style: TextStyle(fontSize: 17 , fontFamily: 'Rubik'),),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}