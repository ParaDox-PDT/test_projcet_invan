import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projcet_invan/data/models/auth_user_model/auth_user_model.dart';
import 'package:test_projcet_invan/main.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileGetInfoEvent>(_onGetInfo);
    on<ProfileLogoutEvent>(_onLogOut);
  }

  void _onGetInfo(ProfileGetInfoEvent event, Emitter<ProfileState> emit) {
    UserModel? currentUser = localeStorage.getCurrentUser();
    UserModelList? users = localeStorage.getUsers();
    emit(state.copyWith(
      currentUser: currentUser,
      users: users?.users ?? [],
    ));
  }

  void _onLogOut(ProfileLogoutEvent event, Emitter<ProfileState> emit) {
    localeStorage.setCurrentUser(user: null);
    emit(state.copyWith(currentUser: null));
  }
}
