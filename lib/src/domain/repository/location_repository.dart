import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/constants/strings/strings.dart';
import 'package:http/http.dart' as http;

class LocationRepository {
  static Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getCurrentCity() async {
    Position p = await getPosition();
    String city = await getCity(p);
    
    return city;
  }

  static Future<String> getCity(Position p) async {
    String data = await rootBundle.loadString(Strings.apiKey);
    String apiKey = jsonDecode(data)["API_KEY"];
    String url =
        "${Strings.baseUrl}${Strings.search}?q=${p.latitude},${p.longitude}&key=$apiKey";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'PostmanRuntime/7.32.3',
      },
    );
    if (response.statusCode == 200) {
      var s = jsonDecode(response.body) as List<dynamic>;
      return s[0]["name"];
    }
    return '';
  }
}
