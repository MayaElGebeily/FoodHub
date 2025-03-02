
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'confirmation.dart';
import '../aid/CheckoutProgress.dart';


class visa extends StatefulWidget {
  const visa({super.key});


  @override
  _visaState createState() => _visaState();
}

class _visaState extends State<visa> {
  final _formKey = GlobalKey<FormState>();
  final _shippingKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _BuildingNumberController = TextEditingController();
  final TextEditingController _FloorNumberController = TextEditingController();
  final TextEditingController _ApartementNumberController = TextEditingController();
  final TextEditingController _DistrictNumberController = TextEditingController();
  final TextEditingController _CompoundNameController = TextEditingController();
  final String creditCard = 'Credit Card/Debit Card';
  final String payPal = 'PayPal';
  final String COD = 'Cash On Delivery';
  final String instaPay = 'InstaPay';
  String? _selectedValue;

  final List<String> _CairoZones = [
    'Nasr City',
    'Heliopolis',
    'Downtown Cairo',
    'Zamalek',
    'Maadi',
    'Mohandessin',
    'Dokki',
    'Garden City',
    'Sheikh Zayed City',
    'October City',
    'Al Rehab City',
    'Madinaty',
    'New Cairo',
  ];

  String? _paymentMethod;
  bool _showError = false;
  bool _showForm = false;
  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }
  void disposeShipping() {
    _BuildingNumberController.dispose();
    _ApartementNumberController.dispose();
    _FloorNumberController.dispose();
    _DistrictNumberController.dispose();
    _CompoundNameController.dispose();
    super.dispose();
  }
  void _submitPayement(){
    if(_formKey.currentState!.validate()){
      if (kDebugMode) {
        print('Card Number : ${_cardNumberController.text}');
      }
      if (kDebugMode) {
        print('Expiry Date : ${_expiryDateController.text}');
      }
      if (kDebugMode) {
        print('CVV : ${_cvvController.text}');
      }
      if (kDebugMode) {
        print('Card Holder Name : ${_cardHolderController.text}');
      }
    }
  }
  void _submitShipping(){
    if(_shippingKey.currentState!.validate()){
      if (kDebugMode) {
        print('Building Number : ${_BuildingNumberController.text}');
      }
      if (kDebugMode) {
        print('Floor Number : ${_FloorNumberController.text}');
      }
      if (kDebugMode) {
        print('Apartment Number : ${_ApartementNumberController.text}');
      }
      if (kDebugMode) {
        print('District Number : ${_DistrictNumberController.text}');
      }
      if (kDebugMode) {
        print('Compound Name : ${_CompoundNameController.text}');
      }
    }
  }

  void _nextButton() {
    // First validate that a payment method is selected
    if (_paymentMethod == null) {
      setState(() {
        _showError = true;
      });
      return; // Exit the method early if no payment method is selected
    }
    setState(() {
      _showError = false;
    });
    // Continue with existing validation
    bool isCardPayment = _paymentMethod == creditCard || _paymentMethod == payPal;
    bool isPaymentValid = isCardPayment ? _formKey.currentState!.validate() : true;
    bool isShippingValid = _shippingKey.currentState!.validate();

    if (isPaymentValid && isShippingValid) {
      if (isCardPayment) {
        _submitPayement();
      }
      _submitShipping();

      // Navigate to the confirmation page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Confirmation(
            buildingNumber: _BuildingNumberController.text,
            floorNumber: _FloorNumberController.text,
            apartmentNumber: _ApartementNumberController.text,
            districtName: _DistrictNumberController.text,
            compoundName: _CompoundNameController.text,
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:  Padding(padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  CheckoutProgress(currentStep: 1),
                  Container(
                    color: Colors.white,
                    width: 500,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 17,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Stack(
                            children: [
                              // Black outlined text
                              Text(
                                'Choose A Payment Method',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rubik',
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = const Color.fromRGBO(53, 95, 46, 0.7),
                                ),
                              ),
                              // White filled text
                              const Text(
                                'Choose A Payment Method',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rubik',
                                  color: Color.fromRGBO(168, 205, 137, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        ListTile(
                          title: const Text('Credit Card/Debit Card' ,
                            style: TextStyle(color: Color.fromRGBO(60, 85, 45, 1), fontFamily: 'Rubik' , fontWeight: FontWeight.bold),),
                          leading: Radio<String>(
                            value: creditCard,
                            groupValue: _paymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                _paymentMethod = value;
                                _showForm = true;
                                _showError = false;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('PayPal' , style: TextStyle(color: Color.fromRGBO(60, 85, 45, 1), fontFamily: 'Rubik' , fontWeight: FontWeight.bold)),
                          leading: Radio<String>(
                            value: payPal,
                            groupValue: _paymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                _paymentMethod = value;
                                _showForm = true;
                                _showError = false;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Cash On Delivery' , style: TextStyle(color: Color.fromRGBO(60, 85, 45, 1), fontFamily: 'Rubik' , fontWeight: FontWeight.bold)),
                          leading: Radio<String>(
                            value: COD,
                            groupValue: _paymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                _paymentMethod = value;
                                _showForm = false;
                                _showError = false;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Instapay' , style: TextStyle(color: Color.fromRGBO(60, 85, 45, 1), fontFamily: 'Rubik' , fontWeight: FontWeight.bold)),
                          leading: Radio<String>(
                            value: "instaPay", // Ensure this matches exactly
                            groupValue: _paymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                _paymentMethod = value;
                                _showForm = false;
                                _showError = false;
                              });
                            },
                          ),
                        ),
                        if (_showError)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Please select a payment method!",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (_showForm) ...[
                          details(),
                        ],
                        if (_paymentMethod == "instaPay")
                          const Center(
                            child: Text(
                              "Wallet :Foodie88",
                                style: TextStyle(color: Color.fromRGBO(60, 85, 45, 1), fontFamily: 'Rubik' , fontWeight: FontWeight.bold),
                            ),
                          )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 500,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 17,),
                        Stack(
                          children: [
                            // Black outlined text
                            Text(
                              'Shipment Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Rubik',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = const Color.fromRGBO(53, 95, 46, 0.7),
                              ),
                            ),
                            // White filled text
                            const Text(
                              'Shipment Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Rubik',
                                color: Color.fromRGBO(168, 205, 137, 1),
                              ),
                            ),
                          ],
                        ) ,
                        const SizedBox(height: 14,),
                        Form(
                          key: _shippingKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(border: Border.all(width: 1 , color: Colors.black) , borderRadius: BorderRadius.circular(7),),
                                child: DropdownButton<String>(
                                  alignment: Alignment.centerLeft,
                                  isExpanded: true,
                                  icon: const FaIcon(FontAwesomeIcons.chevronDown),
                                  value: _selectedValue,
                                  items: _CairoZones.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  },
                                  hint: const Text("Select your area" , style: TextStyle(color: Color.fromRGBO(53, 95, 46, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold,),),),
                              ),
                              const SizedBox(height: 16,),

                              TextFormField(
                                controller: _CompoundNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Compound Name / Area Name',
                                  labelStyle: TextStyle(color: Color.fromRGBO(53, 95, 46, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold,) ,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(53, 95, 46, 0.7),), // Default border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0 ), // Black when focused
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Black when not focused
                                  ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return'Please Enter a Building Number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16,),
                              TextFormField(
                                controller: _DistrictNumberController,
                                decoration: const InputDecoration(
                                  labelText: 'District Name / Street Name ',
                                  labelStyle: TextStyle(color: Color.fromRGBO(53, 95, 46, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold,) ,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Default border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Black when not focused
                                  ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return'Please Enter a Building Number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16,),
                              TextFormField(
                                controller: _BuildingNumberController,
                                decoration: const InputDecoration(
                                  labelText: 'Building No',
                                  labelStyle: TextStyle(color: Color.fromRGBO(53, 95, 46, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold,) ,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Default border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Black when not focused
                                  ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return'Please Enter a Building Number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16,),
                              TextFormField(
                                controller: _FloorNumberController,
                                decoration: const InputDecoration(
                                  labelText: 'Floor No',
                                  labelStyle: TextStyle(color: Color.fromRGBO(53, 95, 46, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold,) ,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Default border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Black when not focused
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16,),
                              TextFormField(
                                  controller: _ApartementNumberController,
                                  decoration: const InputDecoration(
                                    labelText: 'Apartment No',
                                    labelStyle: TextStyle(color: Color.fromRGBO(53, 95, 46, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold,) ,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black), // Default border color
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black), // Black when not focused
                                    ),
                                  )
                              ),
                              const SizedBox(height: 19,),
                              Align(
                                alignment: FractionalOffset.bottomRight,
                                child: SizedBox(
                                  width: 160,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(255, 101, 0, 1),), // Use MaterialStateProperty.all here
                                      shape: WidgetStateProperty.all<RoundedRectangleBorder>( // And here
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: _nextButton,
                                    child: const Text('Proceed' , style: TextStyle(color: Colors.white , fontFamily: 'Rubik' , fontSize: 17),),),
                                ),
                              ),
                            ],
                          ),),
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
Form details(){
    return Form(
      key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                labelStyle: TextStyle(color:Color.fromRGBO(60, 85, 45, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold),
                hintText: 'XXXX XXXX XXXX XXXX',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black when not focused
                ),              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter your card number';
                }
                else if(value.length != 16){
                  return 'Card number must be 16 digits';
                }
                else if(!value .isNumericOnly){
                  return 'Input should be numeric only';
                }
                return null;
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              controller: _expiryDateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Expiry Date',
                labelStyle: TextStyle(color:Color.fromRGBO(60, 85, 45, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold),
                hintText: 'MM/YY',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black when not focused
                ),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter the expiry date';
                }
                else if(!RegExp(r'^(0[1-9]|1[0-2])/?([0-9]{2})$').hasMatch(value)){
                  return 'Enter a valid expiry date (MM/YY)';
                }
                List<String> parts = value.split('/');
                int month = int.parse(parts[0]);
                int year = int.parse(parts[1]);
                DateTime now = DateTime.now();
                int currentYear = now.year % 100;
                int currentMonth = now.month ;
                if( year < currentYear || (year == currentYear && month < currentMonth) ){
                  return 'This Card has expired';
                }
                return null;
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              controller: _cvvController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'CVV',
                labelStyle: TextStyle(color:Color.fromRGBO(60, 85, 45, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold),
                hintText: 'XXX / XXXX',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black when not focused
                ),              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter cvv';
                }
                else if(value.length != 3 && value.length != 4){
                  return 'CVV must be 3 or 4 digits';
                }
                else if(!value.isNumericOnly){
                  return 'CVV must be numeric only';
                }
                return null;
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              controller: _cardHolderController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'CardHolder Name',
                labelStyle: TextStyle(color:Color.fromRGBO(60, 85, 45, 1) , fontFamily: 'Rubik' , fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Black when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black when not focused
                ),              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter the cardholder name';
                }
                else if(!value .isAlphabetOnly){
                  return 'Input should be letters only';
                }
                return null;
              },
            ),
            const SizedBox(height: 16,),
          ],
        ),);
}

}