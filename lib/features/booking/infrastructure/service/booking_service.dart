import 'package:flutter/material.dart';
import 'package:lc_airline/core/network/network_provider.dart';
import 'package:lc_airline/core/network/path/api_path.dart';
import 'package:lc_airline/core/storage/cache_data.dart';
import 'package:lc_airline/core/storage/cache_data_impl.dart';
import 'package:lc_airline/features/booking/infrastructure/models/flight_response.dart';

class BookingService {
  late final NetworkProvider _networkProvider;
  late final CacheData _cacheData;

  BookingService({NetworkProvider? networkProvider, CacheData? cacheData})
    : _networkProvider = networkProvider ?? NetworkProvider(),
      _cacheData = cacheData ?? CacheDataImpl();

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
}