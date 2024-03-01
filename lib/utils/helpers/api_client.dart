import 'package:http/http.dart' as http;
import 'package:movies_app/utils/helpers/app_logger.dart';

class ApiClient {
  static final ApiClient instance = ApiClient._internal();

  final http.Client _client = http.Client();

  ApiClient._internal();

  Future<http.Response> get(String url,
      {Map<String, String> headers = const {}}) async {
    try {
      final response = await _client.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        AppLogger().info(
            'response.statuscode ============================ \n ${response.statusCode}');
        AppLogger().info(
            'response.body ============================ \n ${response.body}');

        return response;
      } else {
        throw Exception('Something went wrong. please try again');
      }
    } catch (e) {
      AppLogger().error(e.toString());

      rethrow;
    }
  }
}
