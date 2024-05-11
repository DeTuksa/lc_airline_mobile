import 'package:flutter/material.dart';
import 'package:lc_airline/core/extensions/context_extensions.dart';
import 'package:lc_airline/features/booking/view/widgets/flight_card.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(toolbarHeight: 0, elevation: 0,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        child: Column(
          children: [
            ...List.generate(3, (index) => const FlightCard())
          ],
        ),
      ),
    );
  }
}
