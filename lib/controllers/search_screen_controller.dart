import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:postal_code_finder/services/onemap_api.dart';

class SearchScreenController extends GetxController {
  final OneMapAPI oneMapAPI = OneMapAPI();
  final postalCodeTextController = TextEditingController();
  final RxInt pageNumber = 1.obs;

  @override
  void onClose() {
    postalCodeTextController.dispose();
  }

  Future<void> onSearch() async {
    if (postalCodeTextController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Missing Input',
          message: 'Please make sure you have provided a postal code.',
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    try {
      oneMapAPI.getAddressResults(
          (postalCodeTextController.text), (pageNumber.toString()));
    } catch (exception) {
      exception.printError();
    }
  }
}
