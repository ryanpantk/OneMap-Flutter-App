import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.text});

  final String text;
  final Styles styles = const Styles();

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: styles.darkTextColor,
        fontWeight: FontWeight.bold,
        fontSize: styles.fontSize,
      ),
    );
  }
}
