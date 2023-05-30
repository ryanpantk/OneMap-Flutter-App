import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.controller, required this.hint});

  final String hint;
  final Styles styles = const Styles();
  final SearchScreenController controller;

  @override
  Widget build(context) {
    return TextField(
      controller: controller.postalCodeTextController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(styles.borderRadius),
          ),
          hintText: hint),
    );
  }
}
