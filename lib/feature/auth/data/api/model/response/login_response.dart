
/// message : "success"
/// user : {"name":"Mohamed Nabil","email":"nabil@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzY2MyN2QzNTJkZWQxYWM1MmE0ZGI2NyIsIm5hbWUiOiJNb2hhbWVkIE5hYmlsIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjgwMzQwMzgsImV4cCI6MTczNTgxMDAzOH0.1gDqXruuRr6LKwL-Qlrl6Vpv4p6tydo4XWldF7Dzu8A"

import "package:json_annotation/json_annotation.dart";
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.message,
    this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}