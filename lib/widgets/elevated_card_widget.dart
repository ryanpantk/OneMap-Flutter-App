import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class ElevatedCardWidget extends StatelessWidget {
  const ElevatedCardWidget(
      {super.key,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  final Styles styles = const Styles();
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(context) {
    return Card(
      color: styles.cardBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(styles.cardBorderRadius)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: styles.cardVerticalPadding,
            horizontal: styles.cardHoriziontalPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}
