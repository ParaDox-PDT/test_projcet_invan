part of '../users_screen_part.dart';

mixin UserScreenMixin on State<UsersScreen> {
  late UsersBloc usersBloc;

  void _init() {
    usersBloc = UsersBloc()..add(UsersGetEvent());
  }

  void _openMap(
      {required String lat, required String long,}) async {
    MapsLauncher.launchCoordinates(double.parse(lat), double.parse(long));
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
