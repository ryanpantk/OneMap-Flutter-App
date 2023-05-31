import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:postal_code_finder/models/search_result.dart';

class OneMapAPI extends GetxService {
  OneMapAPI();

  static const String baseURL = 'https://developers.onemap.sg/commonapi';
  final _connection = GetConnect(timeout: const Duration(seconds: 10));

  void _checkStatusCode(response) {
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception(response.statusCode + ": " + response.statusText);
    }
  }

  Future<dynamic> getAddressResults(
      String searchText, String pageNumber) async {
    String endpoint =
        "$baseURL/search?searchVal=$searchText&returnGeom=Y&getAddrDetails=Y&pageNum=$pageNumber";
    final Response response = await _connection.get(endpoint);

    _checkStatusCode(response);

    return SearchResult.fromJSON(response.body);
  }
}
