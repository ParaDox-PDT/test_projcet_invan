import 'package:hive/hive.dart';

final class LocaleStorage {
  const LocaleStorage(this.box);

  final Box<dynamic> box;

  /// SAVE AND GET COINS
  Future<void> setCoins(int coins) async {
    await box.put('coins', coins);
  }


}
