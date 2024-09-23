part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileGetInfoEvent extends ProfileEvent {
  const ProfileGetInfoEvent();

  @override
  List<Object?> get props => [];
}
