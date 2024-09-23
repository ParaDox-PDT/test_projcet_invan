part of '../post_detail_screen_part.dart';

mixin PostDetailScreenMixin on State<PostDetailScreen> {
  late PostDetailBloc postDetailBloc;
  late ScrollController scrollController;

  void _init() {
    postDetailBloc = PostDetailBloc()
      ..add(PostGetCommentsEvent(postId: widget.postId));
    scrollController = ScrollController()
      ..addListener(
        () {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            postDetailBloc.add(PostGetCommentsEvent(postId: widget.postId));
          }
        },
      );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
