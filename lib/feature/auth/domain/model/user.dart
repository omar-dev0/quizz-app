class User{
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? token;
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