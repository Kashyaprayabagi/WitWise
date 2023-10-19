import 'package:flutter/material.dart';
import 'package:witwise_alpha/screens/Drawer/BottomNav.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedIndex = 0; // Initialize it to the desired initial tab

  // Function to handle tab changes
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
              Container(
              height: 75.0,
              width: 75.0,
              child: Image.asset('images/open.png'),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'WitWise',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              'Welcome to Witwise, your academic resource hub for VIT Bhopal University students.',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            SizedBox(height: 10.0),
            Text(
              'Our Mission',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
                'We are dedicated to enhancing your learning experience by providing essential tools for academic success.',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
              SizedBox(height: 10.0),
          Text(
            'Who We Are',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'A team of VIT Bhopal students and educators passionate about technology and education.',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
              SizedBox(height: 10.0),
          Text(
            'Get In Touch',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.white),
            title: Text(
              'Contact us for questions, suggestions, or support.',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
              SizedBox(height: 10.0),
          Text(
            'Privacy and Legal',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ListTile(
            leading: Icon(Icons.security, color: Colors.white),
            title: Text(
              'Your privacy matters. Review our policies for data handling and app usage terms.',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
              SizedBox(height: 10.0),
          Text(
            'App Version',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Current Version: [App Version Number]  Last Update: [Date of Last Update]',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),],),

          ],
        ),
      ),
    ),
    ),
    bottomNavigationBar: BottomNav(
    selectedIndex: _selectedIndex,
    onTabTapped: _onTabTapped,
    ),);
  }
}


