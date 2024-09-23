import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projcet_invan/data/models/bloc_status.dart';
import 'package:test_projcet_invan/data/models/comment_model/comment_model.dart';
import 'package:test_projcet_invan/data/network/api_service.dart';
import 'package:test_projcet_invan/data/services/injector_container.dart';
import 'package:test_projcet_invan/main.dart';

part 'post_detail_event.dart';

part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc() : super(const PostDetailState()) {
    on<PostGetCommentsEvent>(_onGetComments);
  }

  Future<void> _onGetComments(
      PostGetCommentsEvent event, Emitter<PostDetailState> emit) async {
    emit(state.copyWith(
        status: BlocStatus.loading,
        page: localeStorage.getCommentsPage() ?? 1));

    try {
      List<CommentModel> comments = await sl<ApiService>().getComments(
        page: state.page,
        limit: 20,
      );
      comments =
          comments.where((element) => element.postId == event.postId).toList();
      List<CommentModel> commentsList = [...?state.comments, ...comments];
      localeStorage.setCommentsPage(page: state.page + 1);
      emit(state.copyWith(
          status: BlocStatus.success,
          comments: commentsList,
          page: state.page + 1));
    } catch (e) {
      emit(
          state.copyWith(status: BlocStatus.error, errorMessage: e.toString()));
    }
  }
}
