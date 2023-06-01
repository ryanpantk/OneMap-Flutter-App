import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget(
      {super.key, required this.onClicked, required this.label});

  final String label;
  final Styles styles = const Styles();
  final Function onClicked;

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
              onClicked();
            },
            child: Text(label),
          ),
        )
      ],
    );
  }
}
