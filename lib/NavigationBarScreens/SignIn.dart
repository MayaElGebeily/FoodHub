import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../UserController.dart';
import '../services/authentication.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(); // Add this line
  final _NameController = TextEditingController(); // Add this line

  String _email = '';
  String _password = '';
  bool _isLogin = true;
  bool _isLoading = false;
  late bool _obscureText = true;
  @override
  void dispose() {
    _emailController.dispose(); // Add this line
    super.dispose();
  }
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    try {
      UserCredential userCredential;

      if (_isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // Add here - after creating the user but before navigation
        final userController = Get.find<UserController>();
        userController.setFullName(_NameController.text);

      }

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
  void _forgotPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address first.')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent! Check your inbox.'),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Something went wrong'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFEA47), Color(0xFFFF8242)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => setState(() => _isLogin = true),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isLogin ? const Color.fromRGBO(242, 107, 15, 1) : Colors.white,
                              foregroundColor: _isLogin ? Colors.white : const Color.fromRGBO(242, 107, 15, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Login'),
                          ),
                          ElevatedButton(
                            onPressed: () => setState(() => _isLogin = false),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !_isLogin ? const Color.fromRGBO(242, 107, 15, 1) : Colors.white,
                              foregroundColor: !_isLogin ? Colors.white : const Color.fromRGBO(242, 107, 15, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                      if(!_isLogin) ...[
                        const SizedBox( height: 20,),
                        TextFormField(
                          controller: _NameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: const TextStyle(
                              fontFamily: 'Rubik',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black), // Normal state border color
                              borderRadius: BorderRadius.circular(8),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2), // Border when focused
                              borderRadius: BorderRadius.circular(8),
                            ),

                            // Optional: Change error border color
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(8),
                            ),

                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) => (value == null || value.isEmpty)? 'Please enter your name' : null,
                        ),
                      ],
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController, // Add this line
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(fontFamily: 'Rubik'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black), // Normal state border color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2), // Border when focused
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Enter a valid email';
                          final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          return !emailRegex.hasMatch(value) ? 'Enter a valid email address' : null;
                        },
                        onSaved: (value) => _email = value!,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(fontFamily: 'Rubik'),
                          suffixIcon: IconButton(
                            icon: FaIcon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash),
                            onPressed: () => setState(() => _obscureText = !_obscureText),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black), // Normal state border color
                            borderRadius: BorderRadius.circular(8),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2), // Border when focused
                            borderRadius: BorderRadius.circular(8),
                          ),

                          // Optional: Change error border color
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        obscureText: _obscureText,
                        validator: (value) => (value == null || value.length < 6) ? 'Password must be at least 6 characters' : null,
                        onSaved: (value) => _password = value!,
                      ),
                      if (_isLogin) ...[
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _forgotPassword,
                            child: const Text('Forgot Password?',
                                style: TextStyle(color: Colors.grey , fontFamily: 'Rubik')
                            ),
                          ),
                        ),
                      ],

          const SizedBox(height: 10),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(242, 107, 15, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 50,
                          ),
                        ),
                        child: Text(_isLogin ? 'Login' : 'Sign Up'),
                      ),
                      const SizedBox(height: 20),
                      const Text("OR", style: TextStyle(color: Colors.grey , fontFamily: 'Rubik')),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              AuthService authService = AuthService();
                              User? user = await authService.signInWithGoogle();
                              if (user != null) {
                                print("Signed in as: ${user.displayName}");
                              } else {
                                print("Sign-in failed");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // Google's white button background
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/google_logo.png', height: 30), // Use the Google logo
                                const SizedBox(width: 12),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(color: Colors.black , fontFamily: 'Rubik' , fontWeight: FontWeight.bold), // Google's text color
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}