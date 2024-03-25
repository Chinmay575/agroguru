// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAccount {
  String id;
  String name;
  String email;
  String displayPic;
  String phone;
  bool isVerified;
  String address;
  String createdAt;
  String lastUpdated;
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
      lastUpdated: createdAt ?? this.lastUpdated,
    );
  }
}
