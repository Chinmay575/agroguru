// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

class Global {
  static List<CameraDescription> cameras = [];

  static String genAIAPIKey = '';

  static Future<void> init() async {
    cameras = await availableCameras();
    String response = await rootBundle.loadString('assets/json/api_key.json');
    Map<String,dynamic> data = await jsonDecode(response);
    genAIAPIKey = data['AI_API_KEY'];
  }
}
