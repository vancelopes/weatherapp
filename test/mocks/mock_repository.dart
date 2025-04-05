import 'package:mockito/mockito.dart';
import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {
  @override
  Future<Weather> getWeather(double latitude, double longitude) async {
    return mockWeatherData;
  }

  final Weather mockWeatherData = Weather(
    current: WeatherInfo(
      timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      temp: 25.0,
      humidity: 80,
      pressure: 1013,
    ),
    hourly: List.generate(
      8,
          (index) => HourlyWeather(
        timestamp: DateTime.now().add(Duration(hours: index)).millisecondsSinceEpoch ~/ 1000,
        temp: 25.0 + index,
        icon: '04d',
      ),
    ),
    daily: List.generate(
      7,
          (index) => DailyWeather(
        timestamp: DateTime.now().add(Duration(days: index)).millisecondsSinceEpoch ~/ 1000,
        tempMin: 20.0 + index,
        tempMax: 30.0 + index,
        icon: '04d',
      ),
    ),
  );
}