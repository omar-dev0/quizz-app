
import 'package:hive/hive.dart';
part 'user.g.dart';
@HiveType(typeId: 0)
class User{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? token;
  @HiveField(7)
  bool? isVerified;

  User({
    this.token,
    this.id,
    this.email,
    this.firstName,
    this.isVerified,
    this.lastName,
    this.phone,
    this.username,
});
}