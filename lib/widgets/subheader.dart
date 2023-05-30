import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({super.key, required this.text});

  final String text;
  final Styles styles = const Styles();

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(182, 0, 0, 0),
        fontSize: 15,
      ),
      textAlign: TextAlign.left,
    );
  }
}
