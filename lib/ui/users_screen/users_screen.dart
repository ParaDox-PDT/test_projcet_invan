part of 'users_screen_part.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> with UserScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Screen'),
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        buildWhen: (p, c) => p.status != c.status,
        bloc: usersBloc,
        builder: (context, state) {
          if (state.status == BlocStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == BlocStatus.error) {
            return const Text('Error');
          } else {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name ?? ''),
                  subtitle: Text(user.username ?? ''),
                  trailing: TextButton(
                    onPressed: () {

                    },
                    child:
                        Text('${user.address.geo.lat},${user.address.geo.lng}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
