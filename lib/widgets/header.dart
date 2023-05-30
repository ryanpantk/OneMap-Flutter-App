import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.left,
    );
  }
}
