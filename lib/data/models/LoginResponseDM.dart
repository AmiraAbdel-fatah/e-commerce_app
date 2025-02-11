import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"Amira Abd Al-Fattah","email":"amira03@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTg1NmE3ZmE3ODk1ZTgxZjMxYTYwMCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtRmF0dGFoIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzkxMjMxMTksImV4cCI6MTc0Njg5OTExOX0.DwlSFSV7wjs-J863FyMjM50nWS26Kyp2p1P7-h0ye4A"

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({super.message, super.user, super.token, this.statusMsg});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDm.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? statusMsg;
}

/// name : "Amira Abd Al-Fattah"
/// email : "amira03@gmail.com"
/// role : "user"

class LoginUserDm extends LoginUserEntity {
  LoginUserDm({
    super.name,
    super.email,
    this.role,
  });

  LoginUserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
