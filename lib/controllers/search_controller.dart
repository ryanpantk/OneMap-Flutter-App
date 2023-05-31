import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:postal_code_finder/controllers/search_result_controller.dart';
import 'package:postal_code_finder/screens/search_results_screen.dart';
import 'package:postal_code_finder/services/onemap_api.dart';

class SearchBarController extends GetxController {
  final OneMapAPI oneMapAPI = OneMapAPI();
  final postalCodeTextController = TextEditingController();
  final searchResultController = Get.put(SearchResultController());
  RxString lastQuery = ''.obs;

  @override
  void onClose() {
    postalCodeTextController.dispose();
  }

  Future<void> onSearch() async {
    try {
      var results = await oneMapAPI.getAddressResults(
          (postalCodeTextController.text),
          (searchResultController.currentPage.value.toString()));

      if (searchResultController.searchEntries.isEmpty ||
          postalCodeTextController.text != lastQuery.value) {
        searchResultController.setSearchResult(results);
      }

      lastQuery.value = postalCodeTextController.text;
      Get.to(() => SearchResultScreen(results, this));
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
