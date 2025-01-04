import 'package:json_annotation/json_annotation.dart';
import 'package:quizz_app/feature/auth/domain/model/Otp_respones_entity.dart';

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

  OtpResponesEntity toDomain(){
    return OtpResponesEntity(
      message: message,
    );
  }
}