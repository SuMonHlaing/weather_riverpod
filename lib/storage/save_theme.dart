import 'package:shared_preferences/shared_preferences.dart';

class MyStorage {
  Future<SharedPreferences> _sharedPerferences() async {
    return await SharedPreferences.getInstance();
  }

  void saveBool({required String key, required bool value}) async {
    SharedPreferences sharedPreferences = await _sharedPerferences();
    sharedPreferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences sharedPreferences = await _sharedPerferences();
    return sharedPreferences.getBool(key) ?? false;
  }
}
