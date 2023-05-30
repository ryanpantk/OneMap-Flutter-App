import 'package:flutter/material.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.controller, required this.hint});

  final SearchScreenController controller;
  final String hint;

  @override
  Widget build(context) {
    return TextField(
      controller: controller.postalCodeTextController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          isDense: true,
          hintText: hint),
    );
  }
}
