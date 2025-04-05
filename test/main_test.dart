import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherapp/constants/cities.dart';
import 'package:weatherapp/data/model/city.dart';
import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/viewmodel/weather_view_model.dart';

import 'mocks/mock_repository.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late MockWeatherRepository mockRepo;
  late WeatherViewModel weatherViewModel;
  final City mockCity = predefinedCities[0];

  setUp(() {
    mockRepo = MockWeatherRepository();
    weatherViewModel = WeatherViewModel(mockRepo);
  });

  group('Fetching weather tests', () {

    test('Initial state should be loading', () {
      expect(weatherViewModel.isLoading.value, true);
    });

    test('Fetch weather successfully', () async {
      when(mockRepo.getWeather(mockCity.lat, mockCity.lon));
      await weatherViewModel.fetchWeatherData();
      expect(weatherViewModel.isLoading.value, false);
      expect(weatherViewModel.cities[0].weather, isA<Weather>());
      expect(weatherViewModel.cities[0].weather?.daily, isA<List<DailyWeather>>());
      expect(weatherViewModel.cities[0].weather?.hourly, isA<List<HourlyWeather>>());
    });

    test('Current weather returns correct data', () async {
      when(mockRepo.getWeather(mockCity.lat, mockCity.lon));
      await weatherViewModel.fetchWeatherData();
      expect(weatherViewModel.cities[0].weather?.current.temp, 25.0);
      expect(weatherViewModel.cities[0].weather?.current.humidity, 80);
      expect(weatherViewModel.cities[0].weather?.current.pressure, 1013);
    });

    test('Hourly weather returns correct data', () async {
      when(mockRepo.getWeather(mockCity.lat, mockCity.lon));
      await weatherViewModel.fetchWeatherData();
      expect(weatherViewModel.cities[0].weather?.hourly.length, 8);
      for(var i = 0; i < weatherViewModel.cities[0].weather!.hourly.length; i++) {
        expect(weatherViewModel.cities[0].weather?.hourly[i].temp, 25.0 + i);
        expect(weatherViewModel.cities[0].weather?.hourly[i].icon, '04d');
      }
    });
  });
}