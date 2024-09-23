part of '../profile_screen_part.dart';

mixin ProfileScreenMixin on State<ProfileScreen> {
  late ProfileBloc profileBloc;

  void _init() {
    profileBloc = ProfileBloc()..add(const ProfileGetInfoEvent());
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
