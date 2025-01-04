import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_code_request_model.g.dart';

@JsonSerializable()
class VeriftOtpCodeReuestModel {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VeriftOtpCodeReuestModel ({
    this.resetCode,
  });

  factory VeriftOtpCodeReuestModel.fromJson(Map<String, dynamic> json) {
    return _$VeriftOtpCodeReuestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VeriftOtpCodeReuestModelToJson(this);
  }
}


