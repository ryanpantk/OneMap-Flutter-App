import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:postal_code_finder/controllers/search_result_controller.dart';
import 'package:postal_code_finder/screens/search_results_screen.dart';
import 'package:postal_code_finder/services/onemap_api.dart';

class SearchBarController extends GetxController {
  static SearchBarController get to => Get.find();

  final OneMapAPI oneMapAPI = OneMapAPI();
  final postalCodeTextController = TextEditingController();
  RxString lastQuery = ''.obs;

  @override
  void onClose() {
    postalCodeTextController.dispose();
  }

  Future<void> onSearch() async {
    dynamic results;
    try {
      if (SearchResultController.to.searchEntries.isEmpty ||
          postalCodeTextController.text != lastQuery.value) {
        results = await oneMapAPI.getAddressResults(
            (postalCodeTextController.text), "1");

        SearchResultController.to.setSearchResult(results);
      } else {
        results = await oneMapAPI.getAddressResults(
            (postalCodeTextController.text),
            (SearchResultController.to.currentPage.value.toString()));
      }

      lastQuery.value = postalCodeTextController.text;
      Get.to(() => SearchResultScreen(results));
    } catch (exception) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Connection Error',
          message: 'Please try again later.',
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
