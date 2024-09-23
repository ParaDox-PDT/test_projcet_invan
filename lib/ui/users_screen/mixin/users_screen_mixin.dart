part of '../users_screen_part.dart';

mixin UserScreenMixin on State<UsersScreen> {
  late UsersBloc usersBloc;

  void _init() {
    usersBloc = UsersBloc()..add(UsersGetEvent());
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
