// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  String id;
  String name;
  double price;
  int discount;
  String category;
  String subCategory;
  double rating;
  int quantity;
  List<String> images;
  List<String> videos;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.category,
    required this.subCategory,
    required this.rating,
    required this.quantity,
    required this.images,
    required this.videos,
  });
  

  Product copyWith({
    String? id,
    String? name,
    double? price,
    int? discount,
    String? category,
    String? subCategory,
    double? rating,
    int? quantity,
    List<String>? images,
    List<String>? videos,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'discount': discount,
      'category': category,
      'subCategory': subCategory,
      'rating': rating,
      'quantity': quantity,
      'images': images,
      'videos': videos,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      discount: map['discount'] as int,
      category: map['category'] as String,
      subCategory: map['subCategory'] as String,
      rating: map['rating'] as double,
      quantity: map['quantity'] as int,
      images: List<String>.from(map['images'] as List<String>),
      videos: List<String>.from(map['videos'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, discount: $discount, category: $category, subCategory: $subCategory, rating: $rating, quantity: $quantity, images: $images, videos: $videos)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.discount == discount &&
      other.category == category &&
      other.subCategory == subCategory &&
      other.rating == rating &&
      other.quantity == quantity &&
      listEquals(other.images, images) &&
      listEquals(other.videos, videos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      discount.hashCode ^
      category.hashCode ^
      subCategory.hashCode ^
      rating.hashCode ^
      quantity.hashCode ^
      images.hashCode ^
      videos.hashCode;
  }
}
