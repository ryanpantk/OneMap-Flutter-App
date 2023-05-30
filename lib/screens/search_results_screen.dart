import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/widgets/spacer.dart';
import 'package:postal_code_finder/widgets/header.dart';
import 'package:postal_code_finder/widgets/subheader.dart';
import 'package:postal_code_finder/widgets/text_input.dart';
import 'package:postal_code_finder/widgets/primary_button.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});

  final Styles styles = const Styles();
  final SearchScreenController controller = SearchScreenController();

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(color: styles.backgroundColor),
        child: const Text("Search Results"));
  }
}
