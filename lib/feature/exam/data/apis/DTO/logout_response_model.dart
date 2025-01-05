import 'package:json_annotation/json_annotation.dart';
import 'package:quizz_app/feature/exam/domain/entities/logout_entity.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponseModel {
  @JsonKey(name: "message")
  final String? message;

  LogoutResponseModel ({
    this.message,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LogoutResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LogoutResponseModelToJson(this);
  }
  LogoutEntity toDomain(){
    return LogoutEntity(
      message: message,
    );
  }
}


