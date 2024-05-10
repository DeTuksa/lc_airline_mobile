
import 'package:lc_airline/core/data/datasource.dart';
import 'package:lc_airline/core/exceptions/api_error.dart';

class DataSourceImpl implements DataSource {
  @override
  Future apiCall({required Future<dynamic> call}) async {
    try {
      return await call;
    } on ApiError {
      rethrow;
    }
  }

}