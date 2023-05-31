import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/widgets/spacing.dart';
import 'package:postal_code_finder/widgets/header.dart';
import 'package:postal_code_finder/widgets/subheader.dart';
import 'package:postal_code_finder/widgets/text_input.dart';
import 'package:postal_code_finder/widgets/primary_button.dart';
import 'package:postal_code_finder/widgets/elevated_card.dart';
import 'package:postal_code_finder/controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final Styles styles = const Styles();
  final SearchBarController controller = SearchBarController();

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(color: styles.backgroundColor),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: styles.horizontalPadding),
          child: ElevatedCard(
            children: [
              const Header(text: '🇸🇬 Enter a Postal Code'),
              const Spacing(height: 8),
              const SubHeader(text: 'Input up to a maximum of 6 digits'),
              const Spacing(),
              TextInput(
                hint: 'Postal Code',
                controller: controller.postalCodeTextController,
                maxCharacters: 6,
                keyboardType: TextInputType.number,
              ),
              const Spacing(),
              PrimaryButton(label: 'Search', onClicked: controller.onSearch),
            ],
          ),
        ),
      ),
    );
  }
}
