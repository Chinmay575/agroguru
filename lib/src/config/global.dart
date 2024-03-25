// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:camera/camera.dart';

class Global {
  static List<CameraDescription> cameras = [];

  static Future<void> init() async {
    cameras = await availableCameras();
  }
}
