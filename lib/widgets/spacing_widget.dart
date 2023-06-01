import 'package:flutter/material.dart';

class SpacingWidget extends StatelessWidget {
  const SpacingWidget({super.key, this.height = 16});
  final double height;

  @override
  Widget build(context) {
    return SizedBox(height: height);
  }
}
