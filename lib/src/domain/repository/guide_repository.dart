import 'dart:convert';

import 'package:agroguru/src/utils/constants/strings/urls.dart';
import 'package:http/http.dart' as http;

class GuideRepository {
  static Future<Map<String, dynamic>> getPlantData() async {
    try {
      String url = Urls.localApiUrl + Endpoints.guide;

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
