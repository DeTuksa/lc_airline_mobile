part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();
}

final class BookingInitial extends BookingState {
  @override
  List<Object> get props => [];
}

class LoadingFlights extends BookingState {
  @override
  List<Object> get props => [];
}

class FetchedFlightsSuccess extends BookingState {
  final Object flights;
  const FetchedFlightsSuccess(this.flights);

  @override
  List<Object> get props => [];

  @override
  bool operator == (Object other ) {
    if (identical(this, other)) return true;

    return other is FetchedFlightsSuccess && other.flights == flights;
  }

  @override
  int get hashCode => flights.hashCode;
}

class FetchedFlightsError extends BookingState {
  final Object error;
  const FetchedFlightsError(this.error);

  @override
  List<Object?> get props => [];

  @override
  bool operator == (Object other) {
    if(identical(this, other)) return true;

    return other is FetchedFlightsError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

}