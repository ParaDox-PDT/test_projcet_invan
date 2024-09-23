part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    required this.isLoggedIn,
  });

  final bool isLoggedIn;

  SplashState copyWith({
    bool? isLoggedIn,
  }) {
    return SplashState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object?> get props => [
        isLoggedIn,
      ];
}
