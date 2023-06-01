import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/widgets/spacing_widget.dart';
import 'package:postal_code_finder/widgets/header_widget.dart';
import 'package:postal_code_finder/widgets/subheader_widget.dart';
import 'package:postal_code_finder/widgets/text_input_widget.dart';
import 'package:postal_code_finder/widgets/primary_button_widget.dart';
import 'package:postal_code_finder/widgets/elevated_card_widget.dart';
import 'package:postal_code_finder/controllers/search_bar_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final Styles styles = const Styles();
  final searchBarController = Get.find<SearchBarController>();

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(color: styles.backgroundColor),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: styles.horizontalPadding),
          child: ElevatedCardWidget(
            children: [
              const HeaderWidget(text: '🇸🇬 Postal Code Finder'),
              const SpacingWidget(height: 8),
              const SubHeaderWidget(text: 'Enter a place / location / address'),
              const SpacingWidget(),
              TextInputWidget(
                hint: 'Postal Code',
                controller: searchBarController.postalCodeTextController,
              ),
              const SpacingWidget(),
              PrimaryButtonWidget(
                  label: 'Search', onClicked: searchBarController.onSearch),
            ],
          ),
        ),
      ),
    );
  }
}
