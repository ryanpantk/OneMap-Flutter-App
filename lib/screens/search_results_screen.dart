import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/controllers/search_screen_controller.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/models/search_result.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen(this.results, {super.key});

  final Styles styles = const Styles();
  final SearchResult results;
  final SearchScreenController controller = SearchScreenController();

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(color: styles.backgroundColor),
      child: const Text("Search Results"),
    );
  }
}
