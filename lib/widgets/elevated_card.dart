import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({super.key, required this.children});

  final Styles styles = const Styles();
  final List<Widget> children;

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
