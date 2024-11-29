import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialText;
  final bool isPassword;
  final IconData? prefixIcon;
  final TextEditingController controller;

  CustomTextField({
    Key? key,
    required this.hintText,
    this.initialText = '',
    this.isPassword = false,
    this.prefixIcon,
    TextEditingController? controller,
  })  : controller = controller ?? TextEditingController(text: initialText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
      ),
    );
  }
}

