
import "package:hive/hive.dart";
import "package:json_annotation/json_annotation.dart";
part 'login_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.message,
    this.token,this.code});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];code = json['code'];
  }
  @HiveField(0)
  String? message;
  @HiveField(1)
  String? token;
  @HiveField(2)
  int? code;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['code'] = code;
    return map;
  }

}