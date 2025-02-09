/// message : "success"
/// user : {"name":"Amira Abd Al-Fattah","email":"amira03@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTg1NmE3ZmE3ODk1ZTgxZjMxYTYwMCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtRmF0dGFoIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzkwODU0ODAsImV4cCI6MTc0Njg2MTQ4MH0.OqB9c6_W4atqt8b1XIxmE4KZki_4Gn-AH-loKV9NC2w"

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

/// name : "Amira Abd Al-Fattah"
/// email : "amira03@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  UserEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }

  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
