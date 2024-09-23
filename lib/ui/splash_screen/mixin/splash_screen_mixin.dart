part of '../splash_screen_part.dart';

mixin SplashScreenMixin on State<SplashScreen> {
  late SplashBloc splashBloc;

  void _init() {
    splashBloc = SplashBloc()..add(SplashScreenCheckUserEvent());
  }

  void listener(context, state) {
    if (state.isLoggedIn) {
      print(state.isLoggedIn);
      Future.delayed(
          splashScreenDuration,
          () => Navigator.of(context)
              .pushReplacementNamed(RouteNames.homeScreen));
    } else {
      print(state.isLoggedIn);
      Future.delayed(splashScreenDuration,
          () => Navigator.of(context).pushReplacementNamed(RouteNames.auth));
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
