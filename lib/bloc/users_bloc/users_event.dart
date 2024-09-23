part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();
}

class UsersGetEvent extends UsersEvent {
  @override
  List<Object?> get props => [];
}
