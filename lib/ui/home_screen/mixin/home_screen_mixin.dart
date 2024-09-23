part of '../home_screen_part.dart';

mixin HomeScreenMixin on State<HomeScreen> {
  late HomeBloc homeBloc;
  List<Widget> screens = [
    const PostScreen(),
    const UsersScreen(),
    const ProfileScreen(),
  ];

  void _init() {
    homeBloc = sl<HomeBloc>();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
