
import 'package:json_annotation/json_annotation.dart';

part 'Otp_code_request.g.dart';
@JsonSerializable()
class OtpCodeRequest {
  @JsonKey(name: "email")
  final String? email;

  OtpCodeRequest ({
    this.email,
  });

  factory OtpCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$OtpCodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OtpCodeRequestToJson(this);
  }

}