class BookingQuery {
  int id;
  String flightType;
  int noOfSeats;

  BookingQuery(
      {required this.id, required this.flightType, required this.noOfSeats});

  Map<String, dynamic> toJson() => {
    "id": id,
    "flightClass": flightType,
    "noOfSeats": noOfSeats
  };
}
