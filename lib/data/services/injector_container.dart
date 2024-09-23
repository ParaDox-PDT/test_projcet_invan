import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_projcet_invan/data/local_storage/local_storage.dart';
import 'package:test_projcet_invan/data/network/api_service.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> initApp() async {
  await initHive();
  sl.registerSingleton<LocaleStorage>(LocaleStorage(_box));
  sl.registerSingleton<ApiService>(ApiService());
}

Future<void> initHive() async {
  const boxName = 'bloc_mobile_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
