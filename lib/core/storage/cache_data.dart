import 'package:lc_airline/features/auth/infrastructure/model/user_response.dart';

abstract class CacheData {
  Future<String?> getToken();
  Future<void> cacheToken({required String token});
  Future<void> cacheUser({required User user});
  Future<User?> getUser();
  Future<void> logOut();
}