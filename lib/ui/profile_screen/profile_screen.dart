part of 'profile_screen_part.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ProfileScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (p, c) => p != c,
        bloc: profileBloc,
        builder: (context, state) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                    'Fullname : ${state.currentUser?.lastname} ${state.currentUser?.name}'),
                subtitle: Text('Email : ${state.currentUser?.email}'),
              ),
              const Text(
                'Old users',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    UserModel user = state.users[index];
                    return ListTile(
                      leading: const Icon(Icons.person_off),
                      title: Text('Fullname : ${user.lastname} ${user.name}'),
                      subtitle: Text('Email : ${user.email}'),
                    );
                  },
                  itemCount: state.users.length,
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sl<AuthBloc>().add(AuthLogOutEvent());
          Navigator.of(context).pushReplacementNamed(RouteNames.auth);
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
