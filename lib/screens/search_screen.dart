import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/widgets/spacer.dart';
import 'package:postal_code_finder/widgets/header.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: styles.horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: '🇸🇬 Enter a Postal Code'),
            const Spacing(),
            TextInput(hint: 'Postal Code', controller: controller),
            const Spacing(),
            PrimaryButton(label: 'Search', controller: controller),
          ],
        ),
      ),
    );
  }
}
