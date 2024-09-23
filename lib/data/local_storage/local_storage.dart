import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_projcet_invan/data/models/auth_user_model/auth_user_model.dart';
import 'package:test_projcet_invan/data/models/post_model/post_model.dart';

final class LocaleStorage {
  const LocaleStorage(this.box);

  final Box<dynamic> box;

  /// SAVE AND GET USERS
  Future<void> setUsers({required UserModelList users}) async {
    await box.put('users', users);
  }

  UserModelList? getUsers() => box.get('users');

  /// SAVE AND GET POSTS
  Future<void> setPosts({required PostModelList posts}) async {
    await box.put('posts', posts);
  }

  PostModelList? getPosts() => box.get('posts');

  /// SAVE AND GET CURRENT USER
  Future<void> setCurrentUser({required UserModel? user}) async {
    await box.put('currentUser', user);
  }

  UserModel? getCurrentUser() => box.get('currentUser');

  /// SAVE AND GET COMMENTS PAGE
  Future<void> setCommentsPage({required int page}) async {
    await box.put('commentsPage', page);
  }

  int? getCommentsPage() => box.get('commentsPage');
}

HiveInterface hiveRegister() => Hive
  ..registerAdapter(UserModelAdapter())
  ..registerAdapter(PostModelListAdapter())
  ..registerAdapter(UserModelListAdapter())
  ..registerAdapter(PostModelAdapter());
