import 'package:flutter/material.dart';
import 'package:postal_code_finder/widgets/header.dart';
import 'package:postal_code_finder/widgets/text_input.dart';
import 'package:postal_code_finder/widgets/primary_button.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController controller = SearchScreenController();

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: '🇸🇬 Enter a Postal Code'),
            const SizedBox(height: 16),
            TextInput(hint: 'Postal Code', controller: controller),
            const SizedBox(height: 16),
            PrimaryButton(label: 'Search', controller: controller),
          ],
        ),
      ),
    );
  }
}
