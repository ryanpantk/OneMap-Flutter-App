import 'package:get/get.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/models/search_result.dart';

class SearchResultController extends GetxController {
  final List<SearchEntry> searchEntries = <SearchEntry>[].obs;
  RxInt maxPage = 0.obs;
  RxInt currentPage = 1.obs;

  void setSearchResult(SearchResult searchResult) {
    searchEntries.clear();
    searchEntries.addAll(searchResult.results);
    maxPage.value = searchResult.totalNumberOfPages;
    currentPage.value = searchResult.pageNumber;
  }

  void addSearchResult(SearchResult searchResult) {
    searchEntries.addAll(searchResult.results);
    currentPage.value = searchResult.pageNumber;
  }
}
