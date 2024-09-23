part of 'post_detail_screen_part.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, required this.postId});

  final int postId;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen>
    with PostDetailScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail Screen'),
      ),
      body: BlocBuilder<PostDetailBloc, PostDetailState>(
        bloc: postDetailBloc,
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state.status == BlocStatus.loading &&
              (state.comments ?? []).isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == BlocStatus.error) {
            return const Text('Error');
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    controller: scrollController,
                    itemCount: state.comments?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.comments![index].name),
                        subtitle: Text(state.comments![index].body),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: state.status == BlocStatus.loading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
