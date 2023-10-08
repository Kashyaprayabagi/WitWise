import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:witwise_alpha/screens/HomeScreen.dart';
import 'package:witwise_alpha/screens/IntroScreen.dart';

class AuthService extends StatelessWidget {
  const AuthService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return IntroScreen();
          }
        },),);
  }
}