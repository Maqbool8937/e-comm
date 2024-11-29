import 'dart:async';

import 'package:e_comm/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          // Image in the center
          SizedBox(height: 250,),
          Center(
            child: Image.asset(
              'assets/images/final-google-logo.png', // Replace with your image path
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 20), // Space between image and text
          Text(
            'Welcome to My App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Spacer(), // Pushes the next text to the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0), // Optional padding
            child: Text(
              'Powered by Flutter',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}