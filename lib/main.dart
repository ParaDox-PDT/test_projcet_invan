import 'package:flutter/material.dart';
import 'package:test_projcet_invan/data/local_storage/local_storage.dart';
import 'package:test_projcet_invan/data/services/injector_container.dart';
import 'package:test_projcet_invan/ui/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hiveRegister();
  await initApp();
  runApp(const MainApp());
}

LocaleStorage localeStorage = sl<LocaleStorage>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
