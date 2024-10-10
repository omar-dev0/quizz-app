
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