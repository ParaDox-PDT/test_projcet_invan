part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.currentUser,
    this.users = const [],
  });

  final UserModel? currentUser;
  final List<UserModel> users;

  @override
  List<Object?> get props => [
        currentUser,
        users,
      ];

  ProfileState copyWith({
    UserModel? currentUser,
    List<UserModel>? users,
  }) {
    return ProfileState(
      currentUser: currentUser ?? this.currentUser,
      users: users ?? this.users,
    );
  }
}
