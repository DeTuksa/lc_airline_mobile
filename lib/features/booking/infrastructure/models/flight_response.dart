// To parse this JSON data, do
//
//     final flightResponse = flightResponseFromJson(jsonString);

import 'dart:convert';

FlightResponse flightResponseFromJson(String str) => FlightResponse.fromJson(json.decode(str));

String flightResponseToJson(FlightResponse data) => json.encode(data.toJson());

class FlightResponse {
  String message;
  List<Performance> performances;

  FlightResponse({
    required this.message,
    required this.performances,
  });

  factory FlightResponse.fromJson(Map<String, dynamic> json) => FlightResponse(
    message: json["message"],
    performances: List<Performance>.from(json["performances"].map((x) => Performance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "performances": List<dynamic>.from(performances.map((x) => x.toJson())),
  };
}

class Performance {
  int id;
  String performanceId;
  Flight flight;
  String from;
  String to;
  DateTime departure;
  DateTime arrival;
  String duration;
  String price;
  int staffId;
  DateTime createdAt;
  DateTime updatedAt;
  CreatedBy createdBy;

  Performance({
    required this.id,
    required this.performanceId,
    required this.flight,
    required this.from,
    required this.to,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.price,
    required this.staffId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  factory Performance.fromJson(Map<String, dynamic> json) => Performance(
    id: json["id"],
    performanceId: json["performanceId"],
    flight: Flight.fromJson(json["flight"]),
    from: json["from"],
    to: json["to"],
    departure: DateTime.parse(json["departure"]),
    arrival: DateTime.parse(json["arrival"]),
    duration: json["duration"],
    price: json["price"],
    staffId: json["staffId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: CreatedBy.fromJson(json["createdBy"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "performanceId": performanceId,
    "flight": flight.toJson(),
    "from": from,
    "to": to,
    "departure": departure.toIso8601String(),
    "arrival": arrival.toIso8601String(),
    "duration": duration,
    "price": price,
    "staffId": staffId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy.toJson(),
  };
}

class CreatedBy {
  int id;
  String email;
  String staffId;
  String password;
  String firstName;
  String lastName;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  CreatedBy({
    required this.id,
    required this.email,
    required this.staffId,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    email: json["email"],
    staffId: json["staffId"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "staffId": staffId,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Flight {
  List<List<ClassSeatingPlan>> firstClassSeatingPlan;
  List<List<ClassSeatingPlan>> economyClassSeatingPlan;
  List<List<ClassSeatingPlan>> businessClassSeatingPlan;

  Flight({
    required this.firstClassSeatingPlan,
    required this.economyClassSeatingPlan,
    required this.businessClassSeatingPlan,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    firstClassSeatingPlan: List<List<ClassSeatingPlan>>.from(json["firstClassSeatingPlan"].map((x) => List<ClassSeatingPlan>.from(x.map((x) => ClassSeatingPlan.fromJson(x))))),
    economyClassSeatingPlan: List<List<ClassSeatingPlan>>.from(json["economyClassSeatingPlan"].map((x) => List<ClassSeatingPlan>.from(x.map((x) => ClassSeatingPlan.fromJson(x))))),
    businessClassSeatingPlan: List<List<ClassSeatingPlan>>.from(json["businessClassSeatingPlan"].map((x) => List<ClassSeatingPlan>.from(x.map((x) => ClassSeatingPlan.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "firstClassSeatingPlan": List<dynamic>.from(firstClassSeatingPlan.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "economyClassSeatingPlan": List<dynamic>.from(economyClassSeatingPlan.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "businessClassSeatingPlan": List<dynamic>.from(businessClassSeatingPlan.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class ClassSeatingPlan {
  int row;
  Column column;
  bool isAvailable;

  ClassSeatingPlan({
    required this.row,
    required this.column,
    required this.isAvailable,
  });

  factory ClassSeatingPlan.fromJson(Map<String, dynamic> json) => ClassSeatingPlan(
    row: json["row"],
    column: columnValues.map[json["column"]]!,
    isAvailable: json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "row": row,
    "column": columnValues.reverse[column],
    "isAvailable": isAvailable,
  };
}

enum Column {
  A,
  B,
  C,
  D,
  E,
  F
}

final columnValues = EnumValues({
  "A": Column.A,
  "B": Column.B,
  "C": Column.C,
  "D": Column.D,
  "E": Column.E,
  "F": Column.F
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
