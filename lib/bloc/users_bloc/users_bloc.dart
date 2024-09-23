import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projcet_invan/data/models/bloc_status.dart';
import 'package:test_projcet_invan/data/models/user_model/user_response_model.dart';
import 'package:test_projcet_invan/data/network/api_service.dart';
import 'package:test_projcet_invan/data/services/injector_container.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    on<UsersGetEvent>(_onGetUsers);
  }

  Future<void> _onGetUsers(
      UsersGetEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      final response = await sl<ApiService>().getUsers();
      emit(state.copyWith(status: BlocStatus.success, users: response));
    } catch (e) {
      emit(
        state.copyWith(status: BlocStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
