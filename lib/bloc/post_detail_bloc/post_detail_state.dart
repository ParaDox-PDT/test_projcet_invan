part of 'post_detail_bloc.dart';

class PostDetailState extends Equatable {
  const PostDetailState({
    this.status = BlocStatus.initial,
    this.comments = const [],
    this.page = 1,
    this.errorMessage = '',
  });

  final BlocStatus? status;
  final int page;
  final List<CommentModel>? comments;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        status,
        comments,
        page,
        errorMessage,
      ];

  PostDetailState copyWith({
    BlocStatus? status,
    int? page,
    List<CommentModel>? comments,
    String? errorMessage,
  }) {
    return PostDetailState(
      status: status ?? this.status,
      page: page ?? this.page,
      comments: comments ?? this.comments,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
