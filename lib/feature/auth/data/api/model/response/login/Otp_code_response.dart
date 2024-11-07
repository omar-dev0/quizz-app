import 'package:json_annotation/json_annotation.dart';

part 'Otp_code_response.g.dart';
@JsonSerializable()
class OtpCodeResponse {
  OtpCodeResponse({
      this.message, 
      this.info,});

  OtpCodeResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
  }
  String? message;
  String? info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    return map;
  }

}