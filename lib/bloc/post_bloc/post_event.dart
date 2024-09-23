part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();
}

class PostGetEvent extends PostEvent {
  const PostGetEvent();

  @override
  List<Object?> get props => [];
}
