import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projcet_invan/data/models/bloc_status.dart';
import 'package:test_projcet_invan/data/models/comment_model/comment_model.dart';
import 'package:test_projcet_invan/data/models/photo_model/photo_model.dart';
import 'package:test_projcet_invan/data/models/post_model/post_model.dart';
import 'package:test_projcet_invan/data/network/api_service.dart';
import 'package:test_projcet_invan/data/network/network_info.dart';
import 'package:test_projcet_invan/data/services/injector_container.dart';
import 'package:test_projcet_invan/main.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostGetEvent>(_onGet);
  }

  Future<void> _onGet(PostGetEvent event, Emitter<PostState> emit) async {
    if (localeStorage.getPosts()?.posts.isNotEmpty ?? false) {
      emit(state.copyWith(posts: localeStorage.getPosts()?.posts ?? []));
    }
    if (await sl<NetworkInfoImpl>().isConnected) {
      emit(state.copyWith(status: BlocStatus.loading));
      try {
        final posts = await sl<ApiService>().getPosts();
        localeStorage.setPosts(posts: PostModelList(posts: posts));
        final photos = await sl<ApiService>().getPhotos(page: 1, limit: 100);
        emit(state.copyWith(
            status: BlocStatus.success, posts: posts, photos: photos));
      } catch (e) {
        emit(state.copyWith(
            status: BlocStatus.error, errorMessage: e.toString()));
      }
    }
  }
}
