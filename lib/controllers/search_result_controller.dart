import 'package:get/get.dart';
import 'package:postal_code_finder/controllers/search_bar_controller.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/models/search_result.dart';
import 'package:postal_code_finder/services/onemap_api.dart';

class SearchResultController extends GetxController {
  static SearchResultController get to => Get.find();

  final OneMapAPI oneMapAPI = OneMapAPI();
  RxList<SearchEntry> searchEntries = <SearchEntry>[].obs;
  RxInt maxPage = 0.obs;
  RxInt currentPage = 1.obs;

  void setSearchResult(SearchResult searchResult) {
    searchEntries.value = searchResult.results;
    maxPage.value = searchResult.totalNumberOfPages;
    currentPage.value = searchResult.pageNumber;
  }

  Future<void> addSearchResult() async {
    currentPage.value += 1;
    var searchResult = await oneMapAPI.getAddressResults(
        (SearchBarController.to.postalCodeTextController.text),
        (currentPage.value.toString()));
    searchEntries.addAll(searchResult.results);
    currentPage.value = searchResult.pageNumber;
  }

  bool allResultsShown() {
    return currentPage.value == maxPage.value;
  }
}
