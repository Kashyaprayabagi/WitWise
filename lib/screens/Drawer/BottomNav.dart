import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:witwise_alpha/screens/HomeScreen.dart';

import '../PDF Techniques/PDFTecniques.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  BottomNav({required this.selectedIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: GNav(
          backgroundColor: Colors.redAccent,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: const EdgeInsets.all(8),
          tabs: [
          GButton(
          icon: Icons.home,
          text: 'Home',
            onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
        ),
        GButton(
          icon: Icons.bookmark,
          text: 'Bookmark',
        ),
        GButton(
          icon: Icons.upload,
          text: 'Upload',
          onPressed: () {
            // Call the uploadFile function from FileUploader
            FileUploader.uploadPDF();
          },
        ),
        GButton(
          icon: Icons.book,
          text: 'PYQs',
        ),
      ],)),
    );
  }
}
