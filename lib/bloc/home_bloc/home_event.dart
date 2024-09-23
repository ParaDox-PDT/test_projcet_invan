part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeChangeScreenEvent extends HomeEvent {
  const HomeChangeScreenEvent({required this.screenIndex});

  final int screenIndex;

  @override
  List<Object?> get props => [screenIndex];
}
