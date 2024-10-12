
import "package:json_annotation/json_annotation.dart";
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.message,
    this.token,this.code});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    code = json['code'];
  }
  String? message;
  String? token;
  int? code;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['code'] = code;
    return map;
  }

}