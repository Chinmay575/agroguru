// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:agroguru/src/data/models/prediction.dart';
import 'package:agroguru/src/utils/constants/enums/supported_languages.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccount extends Equatable {
  String id;
  String name;
  String email;
  String displayPic;
  String phone;
  bool isVerified;
  String address;
  String createdAt;
  String lastUpdated;
  String theme;
  String language;
  List<Prediction> predictionHistory;
  UserAccount({
    required this.id,
    required this.name,
    required this.email,
    required this.displayPic,
    required this.phone,
    required this.isVerified,
    required this.address,
    required this.createdAt,
    required this.lastUpdated,
    required this.theme,
    required this.language,
    this.predictionHistory = const [],
  });

  factory UserAccount.fromUser(User acc) {
    return UserAccount(
      id: acc.uid,
      name: acc.displayName ??
          'User ${acc.uid.substring(acc.uid.length - 4, acc.uid.length)}',
      email: acc.email ?? '',
      displayPic: acc.photoURL ?? Strings.avatar,
      phone: acc.phoneNumber ?? '',
      isVerified: acc.emailVerified,
      address: '',
      createdAt: DateTime.now().toString(),
      lastUpdated: DateTime.now().toString(),
      language: Languages.en.toString().split('.').last,
      theme: ThemeMode.system.toString().split('.').last,
      predictionHistory: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'displayPic': displayPic,
      'phone': phone,
      'isVerified': isVerified,
      'address': address,
      'createdAt': createdAt,
      'lastUpdated': lastUpdated,
      'theme': theme,
      'language': language,
      'predictionHistory': predictionHistory.map((e) => e.toMap()),
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      displayPic: map['displayPic'] as String,
      phone: map['phone'] as String,
      isVerified: map['isVerified'] as bool,
      address: map['address'] as String,
      lastUpdated: map['lastUpdated'] as String,
      createdAt: map['createdAt'] as String,
      predictionHistory: (map['predictionHistory'] as List<dynamic>)
          .map((e) => Prediction.fromMap(e))
          .toList(),
      theme: (map['theme'] != null)
          ? map['theme'] as String
          : ThemeMode.system.toString().split('.').last,
      language: (map['language'] != null)
          ? map['language'] as String
          : Languages.en.toString().split('.').last,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  UserAccount copyWith({
    String? id,
    String? name,
    String? email,
    String? displayPic,
    String? phone,
    bool? isVerified,
    String? address,
    String? lastUpdated,
    String? createdAt,
    String? theme,
    String? language,
    List<Prediction>? predictionHistory,
  }) {
    return UserAccount(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      displayPic: displayPic ?? this.displayPic,
      phone: phone ?? this.phone,
      isVerified: isVerified ?? this.isVerified,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      predictionHistory: predictionHistory ?? this.predictionHistory,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      displayPic,
      phone,
      isVerified,
      address,
      createdAt,
      lastUpdated,
      theme,
      language,
      predictionHistory,
    ];
  }
}
