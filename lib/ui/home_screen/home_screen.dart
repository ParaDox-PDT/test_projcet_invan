part of 'home_screen_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (p, c) => p != c,
        builder: (context, state) {
          return IndexedStack(
            children: [
              screens[state.screenIndex],
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (p, c) => p != c,
        bloc: homeBloc,
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) {
              homeBloc.add(HomeChangeScreenEvent(screenIndex: value));
            },
            currentIndex: state.screenIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.post_add,
                ),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add_alt_1_rounded,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
          );
        },
      ),
    );
  }
}
