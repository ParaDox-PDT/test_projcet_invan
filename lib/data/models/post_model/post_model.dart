import 'package:hive/hive.dart';
import 'dart:convert';

part 'post_model.g.dart';

PostModel postsModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postsModelToJson(PostModel data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class PostModel {
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      PostModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}