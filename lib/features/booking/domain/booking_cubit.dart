import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lc_airline/features/booking/domain/repository/booking_repository.dart';
import 'package:lc_airline/features/booking/infrastructure/index.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {

  BookingCubit() : super(BookingInitial());

  BookingRepository repository = BookingRepository();

  List<Performance> flights = [];

  Future getFlights() async {
    try {
      emit(LoadingFlights());
      final response = await repository.getFlights();
      flights = response;
      emit(FetchedFlightsSuccess(response));
    } catch(e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(FetchedFlightsError(e));
    }
  }
}
