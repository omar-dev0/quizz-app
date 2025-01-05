import 'package:json_annotation/json_annotation.dart';
import 'package:quizz_app/feature/auth/domain/model/update_password_entity.dart';

part 'update_password_response_model.g.dart';

@JsonSerializable()
class UpdatePasswordResponesModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  UpdatePasswordResponesModel ({
    this.message,
    this.token,
  });

  factory UpdatePasswordResponesModel.fromJson(Map<String, dynamic> json) {
    return _$UpdatePasswordResponesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdatePasswordResponesModelToJson(this);
  }

  UpdatePasswordEntity toDomain(){
    return UpdatePasswordEntity(
      message: message,
    );
  }
}


