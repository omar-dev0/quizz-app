
import 'package:json_annotation/json_annotation.dart';

part 'Otp_code_request.g.dart';
@JsonSerializable()
class OtpCodeRequest {
  OtpCodeRequest({
      this.email,});

  OtpCodeRequest.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}