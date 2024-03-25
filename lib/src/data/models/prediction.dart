import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Prediction {
  String id;
  String image;
  String? leafName;
  String? result;
  String? description;
  Prediction({
    required this.id,
    required this.image,
    this.leafName,
    this.result,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'leafName': leafName,
      'result': result,
      'description': description,
    };
  }

  factory Prediction.fromMap(Map<String, dynamic> map) {
    return Prediction(
      id: map['id'] as String,
      image: map['image'] as String,
      leafName: map['leafName'] != null ? map['leafName'] as String : null,
      result: map['result'] != null ? map['result'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prediction.fromJson(String source) => Prediction.fromMap(json.decode(source) as Map<String, dynamic>);
}
