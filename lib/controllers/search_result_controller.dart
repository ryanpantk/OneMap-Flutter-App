import 'package:get/get.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/models/search_result.dart';
import 'package:postal_code_finder/services/onemap_api.dart';

class SearchResultController extends GetxController {
  final OneMapAPI oneMapAPI = OneMapAPI();
  List<SearchEntry> searchEntries = <SearchEntry>[].obs;
  RxInt maxPage = 0.obs;
  RxInt currentPage = 1.obs;

  void setSearchResult(SearchResult searchResult) {
    searchEntries.clear();
    searchEntries.addAll(searchResult.results);
    maxPage.value = searchResult.totalNumberOfPages;
    currentPage.value = searchResult.pageNumber;
  }

  Future<void> addSearchResult(controller) async {
    currentPage.value += 1;
    var searchResult = await oneMapAPI.getAddressResults(
        (controller.postalCodeTextController.text),
        (currentPage.value.toString()));
    searchEntries.addAll(searchResult.results);
    currentPage.value = searchResult.pageNumber;
  }

  bool allResultsShown() {
    return currentPage.value == maxPage.value;
  }
}
