import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:postal_code_finder/controllers/search_result_controller.dart';
import 'package:postal_code_finder/screens/search_results_screen.dart';
import 'package:postal_code_finder/services/onemap_api.dart';

class SearchBarController extends GetxController {
  final OneMapAPI oneMapAPI = OneMapAPI();
  final postalCodeTextController = TextEditingController();
  final searchResultController = Get.put(SearchResultController());

  @override
  void onClose() {
    postalCodeTextController.dispose();
  }

  Future<void> onSearch() async {
    if (postalCodeTextController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Empty Postal Code',
          message: 'Please make sure you have provided a postal code.',
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else if (!RegExp(r'^[0-9]+$').hasMatch(postalCodeTextController.text)) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incorrect Postal Code',
          message: 'Postal codes can only contain digits.',
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      try {
        var results = await oneMapAPI.getAddressResults(
            (postalCodeTextController.text), ("1"));
        searchResultController.setSearchResult(results);
        Get.to(() => SearchResultScreen(results, this));
      } catch (exception) {
        print(exception);
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
}
