import 'package:weatherapp/data/model/weather.dart';

class City {
  final int id;
  final String label;
  final String city;
  final String state;
  final String country;
  final String countryShort;
  final double lat;
  final double lon;
  Weather? weather;

  City({
    required this.id,
    required this.label,
    required this.city,
    required this.state,
    required this.country,
    required this.countryShort,
    required this.lat,
    required this.lon,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'],
      label: map['label'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      countryShort: map['countryShort'],
      lat: double.parse(map['lat']),
      lon: double.parse(map['long']),
    );
  }
}