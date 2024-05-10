//
// import 'package:go_router/go_router.dart';
//
// class AppPages {
//   AppPages._();
//
//   static final GoRouter routes =
//       GoRouter(initialLocation: Paths.splashScreen, routes: [
//     GoRoute(
//         name: Paths.splashScreen,
//         path: "/splash-screen",
//         builder: (context, state) => const SplashScreen()),
//     GoRoute(
//         name: Paths.onboardingScreen,
//         path: "/onboarding-screen",
//         builder: (context, state) => const OnboardingScreen()),
//     GoRoute(
//         name: Paths.loginScreen,
//         path: Paths.loginScreen,
//         builder: (context, state) => const LoginScreen()),
//     GoRoute(
//         name: Paths.signUpScreen,
//         path: Paths.signUpScreen,
//         builder: (context, state) => const SignUpScreen()),
//     GoRoute(
//         name: Paths.locationScreen,
//         path: Paths.locationScreen,
//         builder: (context, state) => const LocationScreen()),
//     GoRoute(
//         name: Paths.bottomNavPage,
//         path: Paths.bottomNavPage,
//         builder: (context, state) => const BottomNavigationPage()),
//     GoRoute(
//         name: Paths.eventDetailsScreen,
//         path: Paths.eventDetailsScreen,
//         builder: (context, state) {
//           Event event = state.extra as Event;
//           return EventDetailsScreen(event: event);
//         }),
//     GoRoute(
//         name: Paths.eventCheckoutScreen,
//         path: Paths.eventCheckoutScreen,
//         builder: (context, state) {
//           Event event = state.extra as Event;
//           return EventCheckoutScreen(event: event);
//         }),
//     GoRoute(
//         name: Paths.eventCategoriesScreen,
//         path: Paths.eventCategoriesScreen,
//         builder: (context, state) {
//           return const FavouriteEventScreen();
//         }),
//     GoRoute(
//         name: Paths.searchEventScreen,
//         path: Paths.searchEventScreen,
//         builder: (context, state) {
//           return const SearchEvent();
//         }),
//     GoRoute(
//         name: Paths.notificationScreen,
//         path: Paths.notificationScreen,
//         builder: (context, state) {
//           return const NotificationScreen();
//         }),
//     GoRoute(
//         name: Paths.profileScreen,
//         path: Paths.profileScreen,
//         builder: (context, state) {
//           return const ProfileScreen();
//         }),
//     GoRoute(
//         name: Paths.editProfileScreen,
//         path: Paths.editProfileScreen,
//         builder: (context, state) {
//           return const AccountSettingsScreen();
//         }),
//     GoRoute(
//         name: Paths.updatePasswordScreen,
//         path: Paths.updatePasswordScreen,
//         builder: (context, state) {
//           return const UpdatePasswordScreen();
//         }),
//     GoRoute(
//         name: Paths.viewTicketScreen,
//         path: Paths.viewTicketScreen,
//         builder: (context, state) {
//           tk.Ticket ticket = state.extra as tk.Ticket;
//           return ViewTicketScreen(ticket: ticket);
//         })
//   ]);
// }
