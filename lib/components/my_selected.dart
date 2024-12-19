import 'package:flutter/material.dart';

class MySelected extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final bool isSelected;

  const MySelected(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.height,
      required this.width});

  @override
  State<MySelected> createState() => _MySelectedState();
}

class _MySelectedState extends State<MySelected> {
  bool _isSelected = false;

  void _toggleColor() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isSelected
              ? const Color.fromARGB(255, 195, 225, 249)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isSelected ? Colors.white : Colors.blue,
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 63, 164, 246),
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
