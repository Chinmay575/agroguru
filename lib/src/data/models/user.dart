// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserAccount {
  String id;
  String name;
  String email;
  String displayPic;
  String phone;
  bool isVerified;
  UserAccount({
    required this.id,
    required this.name,
    required this.email,
    required this.displayPic,
    required this.phone,
    required this.isVerified,
  });

  factory UserAccount.fromUser(User acc) {
    return UserAccount(
      id: acc.uid,
      name: acc.displayName ?? '',
      email: acc.email ?? '',
      displayPic: acc.photoURL ?? '',
      phone: acc.phoneNumber ?? '',
      isVerified: acc.emailVerified,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}
