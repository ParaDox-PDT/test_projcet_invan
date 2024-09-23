part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userModel,
    this.isFulled ,
  });

  final UserModel? userModel;
  final bool? isFulled;

  AuthState copyWith({
    UserModel? userModel,
    bool? isFulled,
  }) {
    return AuthState(
      userModel: userModel ?? this.userModel,
      isFulled: isFulled ?? this.isFulled,
    );
  }

  @override
  List<Object?> get props => [
        userModel,
        isFulled,
      ];
}
