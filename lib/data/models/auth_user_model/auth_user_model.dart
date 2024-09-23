import 'package:hive_flutter/adapters.dart';

part 'auth_user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final String email;

  UserModel({
    required this.name,
    required this.lastname,
    required this.email,
  });
}

@HiveType(typeId: 4)
class UserModelList {
  @HiveField(1)
  final List<UserModel> users;

  UserModelList({required this.users});
}
