import 'package:weatherapp/data/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(double latitude, double longitude);
}