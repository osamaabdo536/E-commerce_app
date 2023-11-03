import 'Error.dart';
import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"osama00@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDBkNDM4MGFlNGRkYmEzMzRjM2QxNiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4NzQ3NDQ4LCJleHAiOjE3MDY1MjM0NDh9.o9PdQ1Y0OB9ZyvUqLNEtXFqGgXpkzpTNev4g3sMO39Y"

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.user,
    this.statusMsg,
    this.error,
    this.token,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  Error? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }

}