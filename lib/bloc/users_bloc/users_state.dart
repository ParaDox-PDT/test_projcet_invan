part of 'users_bloc.dart';

class UsersState extends Equatable {
  const UsersState({
    this.status = BlocStatus.initial,
    this.users = const [],
    this.errorMessage = '',
  });

  final BlocStatus status;
  final List<UserResponseModel> users;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        users,
        errorMessage,
      ];

  UsersState copyWith({
    BlocStatus? status,
    List<UserResponseModel>? users,
    String? errorMessage,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
