import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/widgets/spacer.dart';
import 'package:postal_code_finder/widgets/header.dart';
import 'package:postal_code_finder/widgets/subheader.dart';
import 'package:postal_code_finder/widgets/text_input.dart';
import 'package:postal_code_finder/widgets/primary_button.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final Styles styles = const Styles();
  final SearchScreenController controller = SearchScreenController();

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(color: styles.backgroundColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(text: '🇸🇬 Enter a Postal Code'),
                  const Spacing(height: 8),
                  const SubHeader(text: 'Input up to a maximum of 6 digits'),
                  const Spacing(),
                  TextInput(
                    hint: 'Postal Code',
                    controller: controller,
                    maxCharacters: 6,
                    keyboardType: TextInputType.number,
                  ),
                  const Spacing(),
                  PrimaryButton(label: 'Search', controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
