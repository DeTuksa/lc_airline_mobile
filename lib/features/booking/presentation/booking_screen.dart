import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lc_airline/core/extensions/context_extensions.dart';
import 'package:lc_airline/features/booking/domain/booking_cubit.dart';
import 'package:lc_airline/features/booking/presentation/widgets/flight_card.dart';

class BookingScreen extends StatefulWidget {


  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final cubit = BookingCubit();

  final loading = ValueNotifier<bool>(false);

  @override
  void initState() {
    cubit.getFlights();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(toolbarHeight: 0, elevation: 0,),
      body: BlocListener(
        bloc: cubit,
        listener: (context, state) {
          if(state is LoadingFlights) {
            loading.value = true;
          }
          if (state is FetchedFlightsError) {
            loading.value = false;
          }
          if(state is FetchedFlightsSuccess) {
            loading.value = false;
          }
        },
        child: ValueListenableBuilder(
          valueListenable: loading,
          builder: (context, val, _) {
            return loading.value ? const Center(
              child: CupertinoActivityIndicator(),
            ) : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                children: [
                  ...List.generate(cubit.flights.length, (index) =>
                      FlightCard(performance: cubit.flights[index],)
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
