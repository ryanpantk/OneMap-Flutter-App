import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxCharacters,
      this.focusNode,
      this.keyboardType = TextInputType.text});

  final String hint;
  final int? maxCharacters;
  final TextInputType keyboardType;
  final Styles styles = const Styles();
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  Widget build(context) {
    return TextField(
      focusNode: focusNode,
      maxLength: maxCharacters,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(styles.borderRadius),
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: styles.hintFontSize),
          isDense: true),
    );
  }
}
