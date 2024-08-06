// 🎯 Dart imports:
import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpModel {
  String email;
  String name;
  String phone;
  String password;
  SignUpModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
      'password_confirmation': password,
    };
  }
}
