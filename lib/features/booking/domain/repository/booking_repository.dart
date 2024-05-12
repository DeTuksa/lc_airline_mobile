import 'package:lc_airline/core/data/datasource_impl.dart';
import 'package:lc_airline/features/booking/infrastructure/index.dart';

class BookingRepository {
  final _service = BookingService();
  final datasource = DataSourceImpl();

  Future<List<Performance>> getFlights() async {
    final res = await datasource.apiCall(call: _service.getAvailableFlights());
    return res;
  }
}