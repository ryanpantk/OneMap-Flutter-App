import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxCharacters,
      this.keyboardType = TextInputType.text});

  final String hint;
  final int? maxCharacters;
  final TextInputType keyboardType;
  final Styles styles = const Styles();
  final TextEditingController controller;

  @override
  Widget build(context) {
    return TextField(
      maxLength: maxCharacters,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(styles.borderRadius),
          ),
          hintText: hint,
          counterText: '',
          hintStyle: const TextStyle(fontSize: 15),
          isDense: true),
    );
  }
}
