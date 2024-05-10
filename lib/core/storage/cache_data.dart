abstract class CacheData {
  Future<String?> getToken();
  Future<void> cacheToken({required String token});
  Future<void> logOut();
}