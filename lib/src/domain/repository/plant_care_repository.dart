// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:agroguru/src/data/models/prediction.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/domain/repository/user_repository.dart';
import 'package:agroguru/src/utils/constants/strings/collections.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' show basename;
import 'package:uuid/uuid.dart';

import '../../utils/constants/strings/urls.dart';

class PlantCareRepository {
  static Future<Prediction?> predict(String image) async {
    try {
      String url = Urls.localApiUrl + Endpoints.leafDetection;

      File img = File(image);

      http.ByteStream stream =
          http.ByteStream(DelegatingStream.typed(img.openRead()));
      int length = await img.length();

      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(url));

      http.MultipartFile multiPartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: basename(image),
        contentType: MediaType('image', 'jpg'),
      );
      request.files.add(multiPartFile);
      http.StreamedResponse streamResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamResponse);

      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        data['image'] = image;
        data['id'] = const Uuid().v4();
        Prediction p = Prediction.fromAPIMap(data);
        print(p.toMap());
        return p;
      } else {
        return Prediction(
          id: const Uuid().v4(),
          image: image,
          leaf: "Not found",
          accuracy: "0",
          disease: "",
          info: "",
          cure: "",
          products: "",
          cause: "",
        );
      }
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  static Future<bool> uploadPrediction(Prediction p) async {
    if (AuthRepository.curUser != null) {
      DocumentReference ref = UserRepository.db
          .collection(Collections.users)
          .doc(AuthRepository.curUser!.id);

      p.image =
          await uploadPic(id: p.id, folderName: 'predictions', path: p.image);

      print(p.toMap());

      AuthRepository.curUser!.predictionHistory.add(p);

      await ref.set(AuthRepository.curUser!.toMap());
      return true;
    }

    return false;
  }

  static Future<List<Prediction>> getPredictionHistory() async {
    if (AuthRepository.curUser != null) {
      DocumentReference ref = UserRepository.db
          .collection(Collections.users)
          .doc(AuthRepository.curUser!.id);

      var snapshot = await ref.get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        List<Prediction> pred = (data['predictionHistory'] as List)
            .map((e) => Prediction.fromMap(e))
            .toList();

        return pred;
      }
    }
    return [];
  }

  static bool isFile(String path) {
    if (path.isEmpty) return false;
    return !(path.split(':').first == 'http' ||
        path.split(':').first == 'https');
  }

  static Future<String> uploadPic({
    required String id,
    required String folderName,
    String? uniqueId,
    required String path,
  }) async {
    try {
      if (isFile(path)) {
        // print(path);
        String fileName = Uri.decodeFull(path).split('/').last.split('?').first;
        // print(fileName);
        Reference reference;
        if (uniqueId != null) {
          reference = UserRepository.storage
              .ref("users")
              .child(id)
              .child(folderName)
              .child(uniqueId)
              .child(fileName);
        } else {
          reference = UserRepository.storage
              .ref("users")
              .child(id)
              .child(folderName)
              .child(fileName);
        }
        File f = File(path);
        String s = await getUrl(reference);
        // print(s);
        if (s.isEmpty && await f.exists()) {
          await reference.putFile(f).then(
            (val) async {
              return await getUrl(reference);
            },
          );
        }

        return await getUrl(reference);
      }
      return path;
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Upload Error: $e");
      }
      return '';
    }
  }

  static Future<String> getUrl(Reference ref) async {
    try {
      String s = await ref.getDownloadURL();
      // print(s);
      return s;
    } catch (e) {
      return '';
    }
  }
}
