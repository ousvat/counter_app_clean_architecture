import 'package:counter_app/core/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class CounterSharedPrefs {
  SharedPreferences? _prefsInstance;

  Future<SharedPreferences> get prefs async {
    return _prefsInstance ??
        (_prefsInstance = await SharedPreferences.getInstance());
  }

  Future<int> getCounter() async {
    return (await prefs).getInt(AppKeys.counter) ?? 0;
  }

  Future<bool> setCounter(int counter) async {
    return (await prefs).setInt(AppKeys.counter, counter);
  }
}
