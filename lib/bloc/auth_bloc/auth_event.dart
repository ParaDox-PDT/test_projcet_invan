part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthRegisterEvent extends AuthEvent {
  final UserModel user;

  const AuthRegisterEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthLogOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthCheckUserEvent extends AuthEvent {
  final UserModel? user;

  const AuthCheckUserEvent({this.user});

  @override
  List<Object?> get props => [user];
}
