import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projcet_invan/main.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashScreenCheckUserEvent>(_onCheckUser);
  }

  void _onCheckUser(
      SplashScreenCheckUserEvent event, Emitter<SplashState> emit) {
    print(localeStorage.getCurrentUser());
    emit(
      state.copyWith(
        isLoggedIn: localeStorage.getCurrentUser() != null,
        update: !state.update,
      ),
    );
  }
}
