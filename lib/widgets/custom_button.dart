import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  const CustomButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(name,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
    );
  }
}
