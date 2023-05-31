import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/controllers/search_controller.dart';
import 'package:postal_code_finder/models/search_result.dart';
import 'package:postal_code_finder/widgets/elevated_card.dart';
import 'package:postal_code_finder/widgets/spacing.dart';
import 'package:postal_code_finder/widgets/text_input.dart';
import 'package:postal_code_finder/widgets/primary_button.dart';
import 'package:postal_code_finder/controllers/search_result_controller.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen(this.results, this.controller, {super.key});

  final Styles styles = const Styles();
  final SearchResult results;
  final SearchBarController controller;
  final searchResultController = Get.find<SearchResultController>();

  @override
  Widget build(context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: styles.backgroundColor),
      child: Padding(
        padding: EdgeInsets.only(
            left: styles.horizontalPadding,
            right: styles.horizontalPadding,
            top: 60,
            bottom: 20),
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: ElevatedCard(
                children: [
                  TextInput(
                    hint: 'Postal Code',
                    controller: controller.postalCodeTextController,
                    maxCharacters: 6,
                    keyboardType: TextInputType.number,
                  ),
                  const Spacing(),
                  PrimaryButton(
                      label: 'Search', onClicked: controller.onSearch),
                ],
              ),
            ),
            const Spacing(),
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 290,
                child: Obx(
                  () => ElevatedCard(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: searchResultController.searchEntries.isEmpty
                            ? [
                                const Icon(
                                  Icons.report,
                                  color: Colors.red,
                                  size: 80.0,
                                ),
                                const Spacing(),
                                Center(
                                  child: Text(
                                    "Postal Code not found",
                                    style: TextStyle(
                                      color: styles.darkTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ]
                            : searchResultController.searchEntries.map(
                                (e) {
                                  return Text(e.postalCode);
                                },
                              ).toList(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
