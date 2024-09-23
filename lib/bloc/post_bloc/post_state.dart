part of 'post_bloc.dart';

class PostState extends Equatable {
  const PostState(
      {this.status = BlocStatus.initial,
      this.posts = const [],
      this.photos = const [],
      this.errorMessage = ''});

  final BlocStatus status;
  final List<PostModel> posts;
  final List<PhotoModel> photos;
  final String errorMessage;

  @override
  List<Object?> get props => [status, posts, photos, errorMessage];

  PostState copyWith({
    BlocStatus? status,
    List<PostModel>? posts,
    List<CommentModel>? comments,
    List<PhotoModel>? photos,
    String? errorMessage,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      photos: photos ?? this.photos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
