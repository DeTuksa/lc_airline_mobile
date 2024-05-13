import 'dart:convert';

import 'package:lc_airline/features/auth/infrastructure/model/user_response.dart';
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

  @override
  Future<void> cacheUser({required User user}) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString("CACHED_USER", jsonEncode(user.toJson()));
  }

  @override
  Future<User?> getUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final user = sharedPref.getString("CACHED_USER");
    if(user != null) {
      return User.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }
}