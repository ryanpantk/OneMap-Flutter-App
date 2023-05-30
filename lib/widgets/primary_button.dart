import 'package:flutter/material.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.controller, required this.label});

  final SearchScreenController controller;
  final String label;

  @override
  Widget build(context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[800],
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle: const TextStyle(fontSize: 18)),
          onPressed: () {
            controller.onSearch();
          },
          child: Text(label),
        ))
      ],
    );
  }
}
