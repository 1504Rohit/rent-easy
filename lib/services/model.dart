import 'dart:convert';

List<Properties> propertiesFromJson(String str) =>
    List<Properties>.from(json.decode(str).map((x) => Properties.fromJson(x)));

String propertiesToJson(List<Properties> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Properties {
  String housePicture;
  int rentPrice;
  double ratings;
  Location location;

  Properties({
    required this.housePicture,
    required this.rentPrice,
    required this.ratings,
    required this.location,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        housePicture: json["house_picture"],
        rentPrice: json["rent_price"],
        ratings: json["ratings"]?.toDouble(),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "house_picture": housePicture,
        "rent_price": rentPrice,
        "ratings": ratings,
        "location": location.toJson(),
      };
}

class Location {
  String city;
  String state;
  Country country;

  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        state: json["state"],
        country: countryValues.map[json["country"]]!,
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "country": countryValues.reverse[country],
      };
}

enum Country { INDIA }

final countryValues = EnumValues({"India": Country.INDIA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
