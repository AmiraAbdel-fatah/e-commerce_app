/// message : "success"
/// user : {"name":"Amira Abd Al-Fattah","email":"amira03@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTg1NmE3ZmE3ODk1ZTgxZjMxYTYwMCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtRmF0dGFoIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzkxMjMxMTksImV4cCI6MTc0Njg5OTExOX0.DwlSFSV7wjs-J863FyMjM50nWS26Kyp2p1P7-h0ye4A"

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  LoginUserEntity? user;
  String? token;
}

/// name : "Amira Abd Al-Fattah"
/// email : "amira03@gmail.com"
/// role : "user"

class LoginUserEntity {
  LoginUserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
