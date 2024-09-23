import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projcet_invan/data/models/auth_user_model/auth_user_model.dart';
import 'package:test_projcet_invan/main.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthRegisterEvent>(_onRegister);
    on<AuthLogOutEvent>(_onLogOut);
    on<AuthCheckUserEvent>(_onCheckUser);
  }

  void _onRegister(AuthRegisterEvent event, Emitter<AuthState> emit) {
    localeStorage.setCurrentUser(user: event.user);
    emit(state.copyWith(userModel: event.user));
  }

  void _onLogOut(AuthLogOutEvent event, Emitter<AuthState> emit) {
    localeStorage.setCurrentUser(user: null);
    emit(state.copyWith(userModel: null));
  }

  void _onCheckUser(AuthCheckUserEvent event, Emitter<AuthState> emit) {
    if (event.user!.email.isEmpty ||
        event.user!.name.isEmpty ||
        event.user!.lastname.isEmpty) {
      emit(state.copyWith(isFulled: false));
    } else {
      emit(state.copyWith(isFulled: true));
    }
  }
}
