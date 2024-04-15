import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Prediction {
  String id;
  String image;
  String leaf;
  String accuracy;
  String disease;
  String info;
  String cure;
  String products;
  String cause;

  Prediction({
    required this.id,
    required this.image,
    required this.leaf,
    required this.accuracy,
    required this.disease,
    required this.info,
    required this.cure,
    required this.products,
    required this.cause,
  });

  factory Prediction.fromAPIMap(Map<String, dynamic> map) {
    return Prediction(
      id: map['id'] as String,
      image: map['image'] as String,
      leaf: map['data']['leaf'] as String,
      accuracy: map['data']['accuracy'].toString(),
      disease: map['data']['disease']['name'] as String,
      info: map['data']['disease']['info'] as String,
      cure: map['data']['disease']['cure'] as String,
      products: map['data']['disease']['products'] as String,
      cause: map['data']['disease']['cause'] as String,
    );
  }

  factory Prediction.fromMap(Map<String, dynamic> map) {
    return Prediction(
      id: map['id'] as String,
      image: map['image'] as String,
      leaf: map['leaf'] as String,
      accuracy: map['accuracy'] as String,
      disease: map['disease'] as String,
      info: map['info'] as String,
      cure: map['cure'] as String,
      products: map['products'] as String,
      cause: map['cause'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prediction.fromJson(String source) =>
      Prediction.fromMap(json.decode(source) as Map<String, dynamic>);

  Prediction copyWith({
    String? id,
    String? image,
    String? leaf,
    String? accuracy,
    String? disease,
    String? info,
    String? cure,
    String? products,
    String? cause,
  }) {
    return Prediction(
      id: id ?? this.id,
      image: image ?? this.image,
      leaf: leaf ?? this.leaf,
      accuracy: accuracy ?? this.accuracy,
      disease: disease ?? this.disease,
      info: info ?? this.info,
      cure: cure ?? this.cure,
      products: products ?? this.products,
      cause: cause ?? this.cause,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'leaf': leaf,
      'accuracy': accuracy,
      'disease': disease,
      'info': info,
      'cure': cure,
      'products': products,
      'cause': cause,
    };
  }
}
