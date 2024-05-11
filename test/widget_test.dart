import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lc_airline/core/presentation/constants/app_assets.dart';
import 'package:lc_airline/features/booking/view/widgets/flight_card.dart';

void main() {
  testWidgets('FlightCard widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: FlightCard(),
      ),
    ));

    // Verify if the FlightCard widget is rendered
    expect(find.byType(FlightCard), findsOneWidget);

    // Verify if the Image.asset is rendered with the specified asset
    expect(find.byWidgetPredicate((widget) => widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == AppAssets.flight), findsOneWidget);

    // Verify if the Text widget is rendered with the specified text
    expect(find.text("Lagos to London"), findsOneWidget);

    // Verify if the Divider widget is rendered
    expect(find.byType(Divider), findsOneWidget);
  });
}
