import 'package:hive/hive.dart';
import 'package:test_projcet_invan/data/models/auth_user_model/auth_user_model.dart';
import 'package:test_projcet_invan/data/models/post_model/post_model.dart';

final class LocaleStorage {
  const LocaleStorage(this.box);

  final Box<dynamic> box;

  /// SAVE AND GET USERS
  Future<void> setUsers({required List<UserModel> users}) async {
    await box.put('users', users);
  }

  List<UserModel>? getUsers() => box.get('users') ?? [];

  /// SAVE AND GET POSTS
  Future<void> setPosts({required List<PostModel> posts}) async {
    await box.put('posts', posts);
  }

  List<PostModel>? getPosts() => box.get('posts') ?? [];

  /// SAVE AND GET CURRENT USER
  Future<void> setCurrentUser({required UserModel? user}) async {
    await box.put('currentUser', user);
  }

  UserModel? getCurrentUser() => box.get('currentUser');
}
