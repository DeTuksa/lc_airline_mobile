// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:lc_airline/core/presentation/constants/app_assets.dart';
// import 'package:lc_airline/features/booking/presentation/booking_screen.dart';
// import 'package:lc_airline/features/booking/presentation/flight_details_screen.dart';
// import 'package:lc_airline/features/booking/presentation/widgets/flight_card.dart';
//
// void main() {
//   testWidgets('FlightCard widget test', (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: FlightCard(),
//       ),
//     ));
//
//     // Verify if the FlightCard widget is rendered
//     expect(find.byType(FlightCard), findsOneWidget);
//
//     // Verify if the Image.asset is rendered with the specified asset
//     expect(find.byWidgetPredicate((widget) => widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == AppAssets.flight), findsOneWidget);
//
//     // Verify if the Text widget is rendered with the specified text
//     expect(find.text("Lagos to London"), findsOneWidget);
//
//     // Verify if the Divider widget is rendered
//     expect(find.byType(Divider), findsOneWidget);
//   });
//
//   testWidgets('BookingScreen widget test', (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(
//       home: BookingScreen(),
//     ));
//
//     // Verify if the BookingScreen widget is rendered
//     expect(find.byType(BookingScreen), findsOneWidget);
//
//     // Verify if the Scaffold widget is rendered
//     expect(find.byType(Scaffold), findsOneWidget);
//
//     // Verify if the SingleChildScrollView widget is rendered
//     expect(find.byType(SingleChildScrollView), findsOneWidget);
//
//     // Verify if the Column widget is rendered
//     expect(find.byType(Column), findsNWidgets(4));
//
//     // Verify if three FlightCard widgets are rendered
//     expect(find.byType(FlightCard), findsNWidgets(3));
//   });
//
//   testWidgets('FlightDetailsScreen widget test', (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(
//       home: FlightDetailsScreen(),
//     ));
//
//     // Verify if the FlightDetailsScreen widget is rendered
//     expect(find.byType(FlightDetailsScreen), findsOneWidget);
//
//     // Verify if the Scaffold widget is rendered
//     expect(find.byType(Scaffold), findsOneWidget);
//
//     // Verify if the SingleChildScrollView widget is rendered
//     expect(find.byType(SingleChildScrollView), findsOneWidget);
//
//     // Verify if the Container with flight details is rendered
//     expect(find.byWidgetPredicate((widget) =>
//     widget is Container &&
//         widget.decoration is BoxDecoration &&
//         widget.child is Column &&
//         (widget.child as Column).children.length == 2), findsOneWidget);
//
//     // Verify if the Container with flight options is rendered
//     expect(find.byWidgetPredicate((widget) =>
//     widget is Container &&
//         widget.decoration is BoxDecoration &&
//         widget.child is Column &&
//         (widget.child as Column).children.length == 2), findsOneWidget);
//
//     // Verify if the Text widget with flight options title is rendered
//     expect(find.text("Flight Options"), findsOneWidget);
//
//     // Verify if the IconButtons for adding and removing passengers are rendered
//     expect(find.byIcon(Icons.add), findsOneWidget);
//     expect(find.byIcon(Icons.remove), findsOneWidget);
//
//     expect(find.byType(ElevatedButton), findsOneWidget);
//   });
// }
