import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:witwise_alpha/screens/IntroScreen.dart';

import '../HomeScreen.dart';
 // Import your home screen

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async { // Pass the context
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    // Redirect to the home screen after successful sign-in
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(), // Replace with your home screen widget
      ),
    );

    notifyListeners();
  }

  Future<void> handleSignOut(BuildContext context) async { // Pass the context
    try {
      await googleSignIn.signOut();
      // Redirect to the login or welcome screen after sign-out
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroScreen(), // Replace with your login or welcome screen widget
        ),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
