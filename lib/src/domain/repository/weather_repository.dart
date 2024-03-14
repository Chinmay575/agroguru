import 'dart:convert';

import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
// import 'package:weather/src/utils/constants.dart';

class WeatherRepository {
  static Future<Map<String, dynamic>> getCurrentWeather(
      {Position? p, String? city}) async {
    String data = await rootBundle.loadString(Strings.apiKey);
    String apiKey = jsonDecode(data)["API_KEY"];

    String url =
        "${Strings.baseUrl}${Strings.forecast}?q=$city&key=$apiKey&tp=15&days=3";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'PostmanRuntime/7.32.3',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    return {};
  }

  static Future<List<dynamic>> getCitiesList({String? input}) async {
    String data = await rootBundle.loadString(Strings.apiKey);
    String apiKey = jsonDecode(data)["API_KEY"];
    String url = "${Strings.baseUrl}${Strings.search}?q=$input&key=$apiKey";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'PostmanRuntime/7.32.3',
      },
    );
    if (response.statusCode == 200) {
      
      return jsonDecode(response.body) as List<dynamic>;
    }
    return [];
  }

  
}
