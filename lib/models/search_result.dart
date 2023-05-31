import 'package:postal_code_finder/models/search_entry.dart';

class SearchResult {
  final int found;
  final int totalNumberOfPages;
  final int pageNumber;
  final List<SearchEntry> results;

  SearchResult(
      {required this.found,
      required this.totalNumberOfPages,
      required this.pageNumber,
      required this.results});

  factory SearchResult.fromJSON(Map<String, dynamic> json) {
    List<dynamic> searchResults = json["results"];
    List<SearchEntry> results = searchResults
        .map((e) => SearchEntry.fromJSON(e as Map<String, dynamic>))
        .toList();

    return SearchResult(
        found: json["found"],
        totalNumberOfPages: json["totalNumPages"],
        pageNumber: json["pageNum"],
        results: results);
  }
}
