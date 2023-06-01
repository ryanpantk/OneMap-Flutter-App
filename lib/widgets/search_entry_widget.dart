import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/widgets/spacing_widget.dart';

class SearchEntryWidget extends StatelessWidget {
  const SearchEntryWidget(this.element, {super.key});

  final Styles styles = const Styles();
  final SearchEntry element;

  @override
  Widget build(context) {
    return Column(
      children: [
        const SpacingWidget(height: 4),
        Text(
          element.building,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: styles.fontSize,
              color: Colors.indigo[800]),
          textAlign: TextAlign.center,
        ),
        const SpacingWidget(height: 6),
        Text("BLK ${element.blockNumber}"),
        Text(element.roadName, overflow: TextOverflow.ellipsis),
        Text(
            element.postalCode != "NIL" ? element.postalCode : "NO POSTAL CODE",
            overflow: TextOverflow.ellipsis),
        const SpacingWidget(height: 4),
        const Divider(
          height: 20,
          thickness: 0.2,
          indent: 5,
          endIndent: 5,
          color: Colors.indigoAccent,
        ),
      ],
    );
  }
}
