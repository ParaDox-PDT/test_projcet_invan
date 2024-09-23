part of '../auth_screen_part.dart';

mixin AuthScreenMixin on State<AuthScreen> {
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late AuthBloc authBloc;

  void _init() {
    authBloc = sl<AuthBloc>();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }


  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
