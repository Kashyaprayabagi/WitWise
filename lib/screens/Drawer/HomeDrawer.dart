import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:witwise_alpha/screens/App/About.dart';
import 'package:witwise_alpha/screens/App/Developers.dart';
import 'package:witwise_alpha/screens/IntroScreen.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key});

  final User? user = FirebaseAuth.instance.currentUser; // Make user nullable

  void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => IntroScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: user != null ? Text(user!.email!, style: TextStyle(color: Colors.white)) : null, // Check if user is not null
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('images/profile.png')),
            ),
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            accountName: null,
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.white),
            title: Text('Developers', style: TextStyle(color: Colors.white)),
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Developers()));
            }
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.white),
            title: Text('Share', style: TextStyle(color: Colors.white)),
            onTap: () => print('Sharing'),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text('About Us', style: TextStyle(color: Colors.white)),
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              logOut(context); // Call the logOut function
            },
          ),
        ],
      ),
    );
  }
}
