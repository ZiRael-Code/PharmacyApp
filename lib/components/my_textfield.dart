import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hinttext;
  final bool obscuretext;
  final IconButton? suffixicon;
  const MyTextfield(
      {super.key,
      required this.hinttext,
      required this.obscuretext,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        obscureText: obscuretext,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFFf0f0f0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
