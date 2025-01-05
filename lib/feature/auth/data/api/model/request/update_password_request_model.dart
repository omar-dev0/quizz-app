import 'package:json_annotation/json_annotation.dart';

part 'update_password_request_model.g.dart';

@JsonSerializable()
class UpdatePasswordRequestModel {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  UpdatePasswordRequestModel ({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  factory UpdatePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return _$UpdatePasswordRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdatePasswordRequestModelToJson(this);
  }
}


