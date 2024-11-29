
import 'package:flutter/material.dart';

import '../view/home_screen.dart';
// Make sure this path is correct

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0; // Track the selected tab

  // List of screens for bottom navigation
  final List<Widget> _screens = [
    HomeScreen(),
  
    Center(
      child: Text(
        'Notifications',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  // Function to switch screen when tapped from the drawer
  void _onSelectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen',style: TextStyle(color: Colors.amber,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
     
      body: SafeArea(
        child: _screens[_currentIndex], // Display the selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.teal,
        iconSize: 28,
        elevation: 6,
             
        backgroundColor: Colors.red,
        currentIndex: _currentIndex, // Highlight the active tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected tab
          });
        },
        type: BottomNavigationBarType.fixed, // Ensure all items are displayed
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(40)
        ),
        child: FloatingActionButton(
        
          focusColor: Colors.redAccent,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black26,
          onPressed: (){
             
        },
        child: Icon(Icons.add),
            
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

