import 'package:get/get.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/models/search_result.dart';

class SearchResultController extends GetxController {
  final List<SearchEntry> searchEntries = <SearchEntry>[].obs;
  RxInt maxPage = 0.obs;
  RxInt currentPage = 1.obs;

  void setSearchResult(SearchResult searchResult) {
    searchEntries.clear();
    searchEntries
        .addAll(searchResult.results.where((e) => e.postalCode != "NIL"));
    maxPage.value = searchResult.totalNumberOfPages;
    currentPage.value = searchResult.pageNumber;
  }

  void addSearchResult(SearchResult searchResult) {
    searchEntries
        .addAll(searchResult.results.where((e) => e.postalCode != "NIL"));
    currentPage.value = searchResult.pageNumber;
  }
}
