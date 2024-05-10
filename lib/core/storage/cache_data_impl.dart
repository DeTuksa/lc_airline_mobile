import 'package:shared_preferences/shared_preferences.dart';
import 'cache_data.dart';

class CacheDataImpl implements CacheData {
  @override
  Future<void> cacheToken({required String token}) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString("CACHE_TOKEN", token);
  }

  @override
  Future<String?> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    String? data = sharedPref.getString("CACHE_TOKEN");
    return data;
  }

  @override
  Future<void> logOut() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}