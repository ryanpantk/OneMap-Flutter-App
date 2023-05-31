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
                  ),
                  const Spacing(),
                  PrimaryButton(
                      label: 'Search', onClicked: controller.onSearch),
                ],
              ),
            ),
            const Spacing(),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 290,
              child: Obx(
                () => ElevatedCard(
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
                                return GestureDetector(
                                  child: Column(
                                    children: [
                                      const Spacing(height: 4),
                                      Text(
                                        e.building,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: styles.fontSize,
                                            color: Colors.indigo[800]),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Spacing(height: 6),
                                      Text("BLK ${e.blockNumber}"),
                                      Text(e.roadName,
                                          overflow: TextOverflow.ellipsis),
                                      Text(
                                          e.postalCode != "NIL"
                                              ? e.postalCode
                                              : "NO POSTAL CODE",
                                          overflow: TextOverflow.ellipsis),
                                      const Spacing(height: 4),
                                      const Divider(
                                        height: 20,
                                        thickness: 0.2,
                                        indent: 5,
                                        endIndent: 5,
                                        color: Colors.indigoAccent,
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      builder: (context) {
                                        return SizedBox(
                                          height: 300,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    styles.horizontalPadding),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  e.address,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: styles.fontSize,
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const Spacing(),
                                                Image.network(
                                                    "https://developers.onemap.sg/commonapi/staticmap/getStaticImage?layerchosen=default&lat=${e.latitude}&lng=${e.longitude}&zoom=17&height=200&width=500&points=[${e.latitude},${e.longitude},%22255,255,178%22,%22X%22]")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ).toList(),
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
