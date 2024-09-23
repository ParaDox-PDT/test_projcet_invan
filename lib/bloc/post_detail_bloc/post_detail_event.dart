part of 'post_detail_bloc.dart';

sealed class PostDetailEvent extends Equatable {
  const PostDetailEvent();
}

class PostGetCommentsEvent extends PostDetailEvent {
  const PostGetCommentsEvent({required this.postId});

  final int postId;

  @override
  List<Object> get props => [postId];
}
