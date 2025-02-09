import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Amira Abd Al-Fattah","email":"amira03@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTg1NmE3ZmE3ODk1ZTgxZjMxYTYwMCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtRmF0dGFoIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzkwODU0ODAsImV4cCI6MTc0Njg2MTQ4MH0.OqB9c6_W4atqt8b1XIxmE4KZki_4Gn-AH-loKV9NC2w"

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// name : "Amira Abd Al-Fattah"
/// email : "amira03@gmail.com"
/// role : "user"

class UserDM extends UserEntity {
  UserDM({
    super.name,
    super.email,
    this.role,
  });

  UserDM.fromJson(dynamic json) {
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
