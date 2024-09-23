part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.screenIndex = 0,
  });

  final int screenIndex;

  @override
  List<Object?> get props => [
        screenIndex,
      ];

  HomeState copyWith({
    int? screenIndex,
  }) {
    return HomeState(
      screenIndex: screenIndex ?? this.screenIndex,
    );
  }
}
