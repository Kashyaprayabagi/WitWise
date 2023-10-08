import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witwise_alpha/screens/Auth/EmailLogin.dart';

import 'Auth/EmailSignUp.dart';
import 'Auth/GoogleSignUp.dart';

class IntroScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(child:
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.0),
            Image.asset('images/open.png'),
            SizedBox(height: 50.0,width: 300.0,
              child: ElevatedButton(child: Text('Sign Up With Google'), onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),),

                ),),),
            SizedBox(height: 15.0),
            Text('or'),
            SizedBox(height: 15.0),
            SizedBox(height: 50.0,width: 300.0,
              child: ElevatedButton(child: Text('Sign Up With Email'), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupEmail()));
              },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),),
                ),),),
            SizedBox(height: 50.0,),
            CupertinoButton(child:
            Text('Already Have an Account ?  Login',
              style: TextStyle(color: Colors.white),), onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => EmailLogin()));
            })

          ],),),),
    );
  }
}