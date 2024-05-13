import 'package:flutter/material.dart';
import 'package:lc_airline/core/network/network_provider.dart';
import 'package:lc_airline/core/network/path/api_path.dart';
import 'package:lc_airline/features/booking/infrastructure/models/bookingQuery.dart';
import 'package:lc_airline/features/booking/infrastructure/models/flight_response.dart';

class BookingService {
  late final NetworkProvider _networkProvider;

  BookingService({NetworkProvider? networkProvider})
    : _networkProvider = networkProvider ?? NetworkProvider();

  Future<List<Performance>> getAvailableFlights() async {
    try {
      const path = ApiPaths.availableFlights;
      final response = await _networkProvider.call(path, RequestMethod.get);
      final flightRes = FlightResponse.fromJson(response.data);
      return flightRes.performances;
    } catch(e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return [];
    }
  }

  Future bookFlight({required BookingQuery query}) async {
    try {
      const path = ApiPaths.book;
      final response = await _networkProvider.call(path, RequestMethod.post, queryParams: query.toJson());
      final bookingRes = BookingResponse.fromJson(response.data);
      return bookingRes;
    } catch(e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return e;
    }
  }
}