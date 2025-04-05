import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import '../services/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherAPIService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    try {
      final weatherResponse = await apiService.fetchCurrentWeather(lat, lon);
      return Weather(
        current: WeatherInfo.fromJson(weatherResponse['current']),
        hourly: List<HourlyWeather>.from(
          weatherResponse['hourly'].take(12).map((hour) => HourlyWeather.fromJson(hour)),
        ),
        daily: List<DailyWeather>.from(
          weatherResponse['daily'].take(7).map((day) => DailyWeather.fromJson(day)),
        ),
      );
    } catch (e) {
      throw Exception('Failed to fetch weather data for $lat $lon: $e');
    }
  }
}