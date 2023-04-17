part '../parts/user.dart';

class User{
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? accessToken;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.accessToken,
    this.createdAt,
    this.updatedAt
});




  static $fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}