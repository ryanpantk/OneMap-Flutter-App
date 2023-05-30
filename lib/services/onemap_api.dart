import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OneMapAPI extends GetxService {
  OneMapAPI();

  static const String baseURL = 'https://developers.onemap.sg/commonapi';
  final _connection = GetConnect(timeout: const Duration(seconds: 10));

  void _printResponses(Response<dynamic> response) {
    print(response.body);
  }

  Future<dynamic> getAddressResults(
      String searchText, String pageNumber) async {
    String endpoint =
        "$baseURL/search?searchVal=$searchText&returnGeom=Y&getAddrDetails=Y&pageNum=$pageNumber";
    final Response response = await _connection.get(endpoint);

    _printResponses(response);

    return response.body;
  }
}
