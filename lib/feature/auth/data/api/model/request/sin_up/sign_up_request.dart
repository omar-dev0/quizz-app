import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'username')
  String userName;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  SignUpRequest({
    required this.email,
    required this.rePassword,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.userName,
    required this.phone,
  });

  factory SignUpRequest.fromJson(Map<String , dynamic> json)=>_$SignUpRequestFromJson(json);
  Map<String , dynamic> toJson()=>_$SignUpRequestToJson(this);
}
