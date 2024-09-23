part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({this.isLoggedIn , this.update = false});

  final bool? isLoggedIn;
  final bool update;

  SplashState copyWith({
    bool? isLoggedIn,
    bool? update,
  }) {
    return SplashState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      update: update ?? this.update,
    );
  }

  @override
  List<Object?> get props => [
        isLoggedIn,
        update,
      ];
}
