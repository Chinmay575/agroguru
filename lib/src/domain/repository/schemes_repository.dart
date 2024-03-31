import 'dart:convert';

import 'package:agroguru/src/utils/constants/strings/urls.dart';
import 'package:http/http.dart' as http;

class SchemesRepository {
  static Future<Map<String,dynamic>> getSchemes() async {
    try {
      String url = Urls.localApiUrl + Endpoints.schemes;

      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'PostmanRuntime/7.32.3',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
    return {};
  }
}
