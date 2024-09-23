part of 'auth_screen_part.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with AuthScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listenWhen: (p, c) =>p.isFulled!=c.isFulled ,
        listener: (context, state) {
          if (state.isFulled ?? false)  {
            print('STATEATE=>${state.isFulled}');
            authBloc.add(
              AuthRegisterEvent(
                UserModel(
                  name: nameController.text,
                  lastname: lastNameController.text,
                  email: emailController.text,
                ),
              ),
            );
            Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
          } else {
            print('STATEATE=>${state.isFulled}');

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Hamma maydonlar to\'ldirilmagan!')));
          }
        },
        child: Column(
          children: [
            AuthScreenTextfield(hintText: 'Name', controller: nameController),
            AuthScreenTextfield(
                hintText: 'Last Name', controller: lastNameController),
            AuthScreenTextfield(hintText: 'Email', controller: emailController),
            ElevatedButton(
              onPressed: () {
                authBloc.add(AuthCheckUserEvent(
                  user: UserModel(
                    name: nameController.text,
                    lastname: lastNameController.text,
                    email: emailController.text,
                  )
                ));
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue)),
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
