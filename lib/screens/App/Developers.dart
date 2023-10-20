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
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 40.0,
                    width: 325.0,
                    child: const Center(
                      child: Text(
                        'Meet Our Developers',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'R.Srikrishna Kashyap',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0,
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'Lead Developer | Stress Taker | Acid',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text('"Daughter Of A Bitch Born Witch"', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0, // Adjust the size as needed
                          backgroundImage: AssetImage('images/kashyap.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Harsh Mahajan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0,
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'UI/UX Developer | Creative | Dark',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text('"Zindagi Timepass Hai!"', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0, // Adjust the size as needed
                          backgroundImage: AssetImage('images/harsh.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Srishti Rana',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0,
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'Constant Companion | Beauty |\n     Motivational Speaker',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text('"Dudeee."', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0, // Adjust the size as needed
                          backgroundImage: AssetImage('images/srishti.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sahejpreet Kaur',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0,
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'Contributor | Choti Bacchi',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text('"Muje toh 2-2 project karne hai."', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0, // Adjust the size as needed
                          backgroundImage: AssetImage('images/sahej.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '  Lakshya Sachin \n       Bharadwaj',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                ' Contributor | De-motivator',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 2.0),
                              Text('"Muje Kya Karna Hai ?"', style: TextStyle(color: Colors.white))
                              ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0, // Adjust the size as needed
                          backgroundImage: AssetImage('images/lakshya.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tulika Basu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0,
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'Contributor | Black Magic Queen',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text('"Chutiya gaali todi hoti hain."', style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0, // Adjust the size as needed
                          backgroundImage: AssetImage('images/tulika.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
