import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _State();
}

class _State extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              child: GNav(
                backgroundColor: Colors.redAccent,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                gap:8,
                padding: const EdgeInsets.all(8),
                tabs: const [
                  GButton (
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton (
                    icon: Icons.bookmark,
                    text: 'Bookmark',
                  ),
                  GButton(
                    icon: Icons.upload,
                    text: 'Upload',
                  ),
                  GButton (
                    icon: Icons.book,
                    text: 'PYQs',
                  ),
                ],
              ),),),
    ),);
  }
}
