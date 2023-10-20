import 'package:flutter/material.dart';

import '../Drawer/BottomNav.dart';

class Developers extends StatefulWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  State<Developers> createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
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
      backgroundColor: Colors.black12,
      body: SafeArea(
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
              const SizedBox(height: 20.0),
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.black87,
                  elevation: 10.0,
                  child: ListTile(
                    leading: CircleAvatar(child: Image.asset('images/open.png'),),
                    title: const Text(
                      'Kashyap Rayabagi',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Lead Developer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
