import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeChangeScreenEvent>(_onChangeScreen);
  }

  void _onChangeScreen(HomeChangeScreenEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      screenIndex: event.screenIndex,
    ));
  }
}
