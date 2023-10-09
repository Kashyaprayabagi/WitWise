import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witwise_alpha/screens/Auth/EmailLogin.dart';

class SignupEmail extends StatefulWidget {
  @override
  _SignupEmailState createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();
  bool _obscurePassword = true; // State variable for password visibility

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add a GlobalKey for the Scaffold

  Future<void> createAccount(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cpassword = cpasswordController.text.trim();

    try {
      if (email == "" || password == "" || cpassword == "") {
        _showSnackBar("Please Fill All The Fields"); // Show a Snackbar
      } else if (password != cpassword) {
        _showSnackBar("Passwords not matching"); // Show a Snackbar
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        log("User created with email: $email");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmailLogin()),
        );
      }
    } catch (e) {
      _showSnackBar("Error creating account: $e"); // Show a Snackbar with the error message
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true, // Set to true to avoid render overflow
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    child: Image.asset('images/open.png'),
                  ),
                ),
                const Text(
                  'WitWise',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 75.0),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email:',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password:',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: _obscurePassword, // Hide password characters
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off), // Icon for toggling password visibility
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm Password:',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                TextField(
                  controller: cpasswordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: _obscurePassword, // Hide confirm password characters
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: 350.0,
                  child: ElevatedButton(
                    onPressed: () {
                      createAccount(context);
                    },
                    child: Text('Create Account'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                  child: const Text('Already Have an Account? Login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailLogin()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
