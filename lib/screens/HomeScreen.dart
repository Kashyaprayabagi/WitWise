import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:witwise_alpha/screens/App/Syllabus.dart';
import 'package:witwise_alpha/screens/Drawer/HomeDrawer.dart';
import 'PDF Techniques/PDFTecniques.dart'; // Import the FileUploader class

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        drawer: HomeDrawer(),
        appBar: AppBar(
          title: const Text('WitWise'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Divider(),
              SizedBox(
                height: 120.0,
                width: 400.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Syllabus()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text(
                    'Syllabus',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Divider(),
              // Add more buttons as needed
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.redAccent,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
