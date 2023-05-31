import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  const Spacing({super.key, this.height = 16});
  final double height;

  @override
  Widget build(context) {
    return SizedBox(height: height);
  }
}
