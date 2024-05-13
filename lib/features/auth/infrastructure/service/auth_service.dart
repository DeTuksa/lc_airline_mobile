import 'package:flutter/material.dart';
import 'package:lc_airline/core/network/network_provider.dart';
import 'package:lc_airline/core/network/path/api_path.dart';
import 'package:lc_airline/core/storage/cache_data.dart';
import 'package:lc_airline/core/storage/cache_data_impl.dart';
import 'package:lc_airline/features/auth/infrastructure/model/user_body.dart';
import 'package:lc_airline/features/auth/infrastructure/model/user_response.dart';

class AuthService {
  late final NetworkProvider _networkProvider;
  late final CacheData _cacheData;

  AuthService({NetworkProvider? networkProvider, CacheData? cacheData})
    : _networkProvider = networkProvider ?? NetworkProvider(),
      _cacheData = cacheData ?? CacheDataImpl();

  Future login({required UserBody payload}) async {
    try {
      const path = ApiPaths.userLogin;
      final response = await _networkProvider.call(path, RequestMethod.post, data: payload.toJson());
      final userRes = UserResponse.fromJson(response.data);
      await Future.wait([_cacheData.cacheUser(user: userRes.user), _cacheData.cacheToken(token: userRes.token)]);
      return userRes;
    } catch(e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return e;
    }
  }
}