abstract class Paths {
  static const bookingScreen = "/booking-screen";
  static const flightDetailsScreen ="/flight-details-screen";

}

abstract class AppRoutes {
  AppRoutes._();
  static const bookingScreen = Paths.bookingScreen;
  static const flightDetailsScreen = Paths.flightDetailsScreen;
}
