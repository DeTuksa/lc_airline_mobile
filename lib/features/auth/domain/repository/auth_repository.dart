import 'package:lc_airline/core/data/datasource_impl.dart';
import 'package:lc_airline/features/auth/infrastructure/model/user_body.dart';
import 'package:lc_airline/features/auth/infrastructure/service/auth_service.dart';

class AuthRepository {

  final _service = AuthService();
  final datasource = DataSourceImpl();

  Future login({required UserBody payload}) async {
    final res = await datasource.apiCall(call: _service.login(payload: payload));
    return res;
  }
}