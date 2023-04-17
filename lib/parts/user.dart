part of '../model/user.dart';

User _$UserFromJson(Map<String, dynamic> json){
  return User(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    accessToken: json["accessToken"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );
}

Map<String, dynamic> _$UserToJson(User instance){

  Map<String, dynamic> json = {};

  if(instance.id != null) json['id'] = instance.id;
  if(instance.email != null) json['email'] = instance.email;
  if(instance.password != null) json['password'] = instance.password;
  if(instance.firstName != null) json['firstName'] = instance.firstName;
  if(instance.lastName != null) json['lastName'] = instance.lastName;
  if(instance.accessToken != null) json['accessToken'] = instance.accessToken;

  return json;
}