import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:witwise_alpha/screens/IntroScreen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key});

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
            accountName: const Text('Hermoine Granger', style: TextStyle(color: Colors.white),),
            accountEmail: const Text('IamHermoine@gmail.com', style: TextStyle(color: Colors.white),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('images/profile.png'),),
            ),
            decoration: const BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white),),
            onTap: () => print('settings'),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: Colors.white),
            title: const Text('Bookmark', style: TextStyle(color: Colors.white),),
            onTap: () => print('Bookmarked'),
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.white),
            title: const Text('Developers', style: TextStyle(color: Colors.white),),
            onTap: () => print('Developers'),
          ),
          ListTile(
            leading: const Icon(Icons.share, color: Colors.white),
            title: const Text('Share', style: TextStyle(color: Colors.white),),
            onTap: () => print('Sharing'),
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white),
            title: const Text('About Us', style: TextStyle(color: Colors.white),),
            onTap: () => print('We are messed up'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text('Logout', style: TextStyle(color: Colors.white),),
            onTap: () {
              logOut(context); // Call the logOut function
            },
          ),
        ],
      ),
    );
  }
}
