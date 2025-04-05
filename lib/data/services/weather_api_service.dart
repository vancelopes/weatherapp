import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/env.dart';

class WeatherAPIService {
  final String apiKey = Env.apiKey;
  final String baseUrl = 'https://api.openweathermap.org/data/3.0';

  // Fetch current weather data
  Future<Map<String, dynamic>> fetchCurrentWeather(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch current weather');
    }
  }
}