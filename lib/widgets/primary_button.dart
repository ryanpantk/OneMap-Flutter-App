import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.controller, required this.label});

  final String label;
  final Styles styles = const Styles();
  final SearchScreenController controller;

  @override
  Widget build(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: styles.primaryButtonColor,
              padding: EdgeInsets.symmetric(
                  vertical: styles.primaryButtonVerticalPadding),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(styles.primaryButtonBorderRadius),
              ),
              textStyle: TextStyle(
                  fontSize: styles.primaryButtonFontSize,
                  color: styles.lightTextColor),
            ),
            onPressed: () {
              controller.onSearch();
            },
            child: Text(label),
          ),
        )
      ],
    );
  }
}
