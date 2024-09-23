part of 'splash_screen_part.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: splashBloc,
        listenWhen: (p, c) => p != c,
        listener: (context, state) {
         listener(context, state);
        },
        child: const Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
