import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_projcet_invan/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_projcet_invan/bloc/home_bloc/home_bloc.dart';
import 'package:test_projcet_invan/data/local_storage/local_storage.dart';
import 'package:test_projcet_invan/data/network/api_service.dart';
import 'package:test_projcet_invan/data/network/network_info.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> initApp() async {
  await initHive();
  sl.registerSingleton<LocaleStorage>(LocaleStorage(_box));
  sl.registerSingleton<ApiService>(ApiService());
  sl.registerSingleton<HomeBloc>(HomeBloc());
  sl.registerSingleton<AuthBloc>(AuthBloc());
  sl.registerSingleton<NetworkInfoImpl>(
    NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );
}

Future<void> initHive() async {
  const boxName = 'test_project_invan';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
