import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_projcet_invan/data/models/comment_model/comment_model.dart';
import 'package:test_projcet_invan/data/models/photo_model/photo_model.dart';
import 'package:test_projcet_invan/data/models/post_model/post_model.dart';
import 'package:test_projcet_invan/data/models/universal_data.dart';
import 'package:test_projcet_invan/data/models/user_model/user_response_model.dart';
import 'package:test_projcet_invan/utils/constants.dart';

class ApiService {
  Future<UniversalData> getPosts() async {
    Uri uri = Uri.https(baseUrl, '/posts');
    try {
      final response = await http.get(uri);

      return UniversalData(
        data: (jsonDecode(response.body) as List?)
                ?.map((e) => PostModel.fromJson(e))
                .toList() ??
            [],
      );
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<List<PhotoModel>> getPhotos({
    required int page,
    required int limit,
  }) async {
    Uri uri = Uri.https(baseUrl, "/photos", {
      "page": page.toString(),
      "limit": limit.toString(),
    });
    try {
      final response = await http.get(uri);

      return (jsonDecode(response.body) as List?)
              ?.map((e) => PhotoModel.fromJson(e))
              .toList() ??
          [];
    } catch (e) {
      return [];
    }
  }

  Future<List<CommentModel>> getComments({
    required int page,
    required int limit,
  }) async {
    Uri uri = Uri.https(baseUrl, "/comments", {
      "page": page.toString(),
      "limit": limit.toString(),
    });

    try {
      http.Response response = await http.get(
        uri,
      );
      return (jsonDecode(response.body) as List?)
              ?.map((e) => CommentModel.fromJson(e))
              .toList() ??
          [];
    } catch (error) {
      return [];
    }
  }

  Future<List<UserResponseModel>> getUsers() async {
    Uri uri = Uri.https(baseUrl, "/users");

    try {
      http.Response response = await http.get(uri);
      return (jsonDecode(response.body) as List?)
              ?.map((e) => UserResponseModel.fromJson(e))
              .toList() ??
          [];
    } catch (error) {
      return [];
    }
  }
}
