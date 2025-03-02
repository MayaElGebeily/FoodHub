import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_apps/Congrats.dart';
import 'package:my_apps/NavigationBarScreens/HomePage.dart';
import 'package:my_apps/NavigationBarScreens/SplashScreen.dart';
import 'package:my_apps/NavigationBarScreens/confirmation.dart';
import 'package:my_apps/NavigationBarScreens/profile.dart';
import 'NavigationBarScreens/Order.dart';
import 'UserController.dart';
import 'firebase_options.dart';

import 'NavigationBarScreens/SignIn.dart';
import 'NavigationBarScreens/cartPage.dart';
import 'NavigationBarScreens/visa.dart';
import 'menu/burger.dart';
import 'menu/desserts.dart';
import 'menu/drinks.dart';
import 'menu/pasta.dart';
import 'menu/pizza.dart';
import 'menu/salades.dart';

// Global Database Reference
final FirebaseDatabase database = FirebaseDatabase.instance;
User? _initUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await onWaitInitState();
  Get.put(UserController());
  runApp(const MyApp());
}

Future<void> onWaitInitState() async {
  final completer = Completer<void>();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      _initUser = user; // Assign the authenticated user
    }
    if (!completer.isCompleted) {
      completer.complete(); // Ensure completer is only completed once
    }
  });

  return completer.future;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/pizza': (context) => Pizza(),
        '/burger': (context) => const burger(),
        '/pasta': (context) => Pasta(),
        '/salade': (context) => const Salade(),
        '/dessert': (context) => const Desserts(),
        '/drinks': (context) => const Drinks(),
        '/cart': (context) => CartPage(),
        '/visa': (context) => const visa(),
        '/profile': (context) => const Profile(),
        '/Order': (context) => const Order(),
        '/Home': (context) => const HomePage(),
        '/congrats': (context) => const Congrats(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(),
    );
  }
}
