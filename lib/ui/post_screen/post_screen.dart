part of 'post_screen_part.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> with PostScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POST SCREEN'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        buildWhen: (p, c) => p.status != c.status,
        builder: (context, state) {
          if (state.status == BlocStatus.error) {
            return const Center(
              child: Text('ERROR'),
            );
          } else if (state.status == BlocStatus.success) {
            return ListView.builder(
              itemBuilder: (context, index) {
                PostModel postModel = state.posts[index];
                PhotoModel? photoModel;
                if(state.photos.isNotEmpty){
                  photoModel = state.photos[index];
                }
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: photoModel?.url ?? '',
                    width: 50,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                  ),
                  title: Text('TITLE : ${postModel.title}'),
                  subtitle: Text('DESCRIPTION: ${postModel.body}'),
                );
              },
              itemCount: 100,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
