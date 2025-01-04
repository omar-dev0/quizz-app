import 'package:json_annotation/json_annotation.dart';
import 'package:quizz_app/feature/auth/domain/model/verify_otp_entity.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  @JsonKey(name: "status")
  final String? status;

  VerifyOtpResponseModel ({
    this.status,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyOtpResponseModelToJson(this);
  }

  VerifyOtpCodeEntity toDomain(){
    return VerifyOtpCodeEntity(
      message: status,
    );
  }
}


