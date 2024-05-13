import 'package:lc_airline/core/data/datasource_impl.dart';
import 'package:lc_airline/features/booking/infrastructure/index.dart';
import 'package:lc_airline/features/booking/infrastructure/models/bookingQuery.dart';

class BookingRepository {
  final _service = BookingService();
  final datasource = DataSourceImpl();

  Future<List<Performance>> getFlights() async {
    final res = await datasource.apiCall(call: _service.getAvailableFlights());
    return res;
  }

  Future bookFlight({required BookingQuery query}) async {
    final res = await datasource.apiCall(call: _service.bookFlight(query: query));
    return res;
  }
}