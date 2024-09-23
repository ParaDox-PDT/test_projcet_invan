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