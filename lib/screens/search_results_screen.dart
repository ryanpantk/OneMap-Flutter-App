import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/controllers/search_bar_controller.dart';
import 'package:postal_code_finder/models/search_result.dart';
import 'package:postal_code_finder/widgets/elevated_card_widget.dart';
import 'package:postal_code_finder/widgets/spacing_widget.dart';
import 'package:postal_code_finder/widgets/text_input_widget.dart';
import 'package:postal_code_finder/widgets/primary_button_widget.dart';
import 'package:postal_code_finder/widgets/search_entry_widget.dart';
import 'package:postal_code_finder/widgets/map_bottom_sheet_widget.dart';
import 'package:postal_code_finder/controllers/search_result_controller.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen(this.results, {super.key});

  final Styles styles = const Styles();
  final SearchResult results;
  final searchBarController = Get.find<SearchBarController>();
  final searchResultController = Get.find<SearchResultController>();
  final FocusNode focusNode = FocusNode();

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
              child: ElevatedCardWidget(
                children: [
                  TextInputWidget(
                    hint: 'Search for a place',
                    controller: searchBarController.postalCodeTextController,
                    focusNode: focusNode,
                  ),
                  const SpacingWidget(),
                  PrimaryButtonWidget(
                      label: 'Search',
                      onClicked: () {
                        focusNode.unfocus();
                        searchBarController.onSearch();
                      }),
                ],
              ),
            ),
            const SpacingWidget(),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 290,
              child: Obx(
                () => ElevatedCardWidget(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              const SpacingWidget(),
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
                          : [
                              ...searchResultController.searchEntries.map(
                                (element) {
                                  return GestureDetector(
                                    child: SearchEntryWidget(element),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                                styles.bottomSheetBorderRadius),
                                          ),
                                        ),
                                        builder: (context) {
                                          return MapBottomSheetWidget(element);
                                        },
                                      );
                                    },
                                  );
                                },
                              ).toList(),
                              searchResultController.allResultsShown()
                                  ? const SpacingWidget(height: 0)
                                  : PrimaryButtonWidget(
                                      label: 'View More',
                                      onClicked: () => searchResultController
                                          .addSearchResult()),
                            ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
