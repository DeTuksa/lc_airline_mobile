import 'package:go_router/go_router.dart';
import 'package:lc_airline/core/presentation/routes/app_routes.dart';
import 'package:lc_airline/features/booking/view/booking_screen.dart';
import 'package:lc_airline/features/booking/view/flight_details_screen.dart';

class AppPages {
  AppPages._();

  static final GoRouter routes =
      GoRouter(initialLocation: Paths.bookingScreen, routes: [
    GoRoute(
        name: Paths.bookingScreen,
        path: "/booking-screen",
        builder: (context, state) => const BookingScreen()),
    GoRoute(
        name: Paths.flightDetailsScreen,
        path: Paths.flightDetailsScreen,
        builder: (context, state) => const FlightDetailsScreen())
  ]);
}
