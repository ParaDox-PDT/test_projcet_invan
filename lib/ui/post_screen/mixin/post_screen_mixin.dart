part of '../post_screen_part.dart';

mixin PostScreenMixin on State<PostScreen> {
  late PostBloc postBloc;

  void _init() {
    postBloc = PostBloc()..add(const PostGetEvent());
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
