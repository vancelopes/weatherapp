import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weatherapp/data/model/city.dart';
import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';

import '../constants/cities.dart';

class WeatherViewModel extends GetxController {
  final int _fetchIntervalInMinutes = 10;
  final RxInt activeCityIndex = 0.obs;
  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final WeatherRepository repo;
  Timer? _timer;
  RxList<City> get cities => predefinedCities.obs;

  WeatherViewModel(this.repo);

  @override
  void onInit() {
    super.onInit();
    fetchWeatherData();
    _startPeriodicFetch();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(
      Duration(minutes: _fetchIntervalInMinutes),
      (timer) => fetchWeatherData(),
    );
  }

  Future<void> fetchWeatherData() async {
    isLoading.value = true;
    error.value = '';

    try {
      await Future.wait(
        cities.map((city) async => city.weather = await repo.getWeather(city.lat, city.lon))
      );
    } catch (e) {
      error.value = 'Failed to fetch weather data: $e';
    } finally {
      isLoading.value = false;
    }
  }

  List<DailyWeather> get dailyWeather {
    if (activeCityIndex.value < 0 || activeCityIndex.value >= cities.length) {
      return [];
    }
    return cities[activeCityIndex.value].weather?.daily ?? [];
  }

  List<HourlyWeather> get hourlyWeather {
    if (activeCityIndex.value < 0 || activeCityIndex.value >= cities.length) {
      return [];
    }
    return cities[activeCityIndex.value].weather?.hourly ?? [];
  }

  void updateActiveCityIndex(int index) {
    if (index >= 0 && index < cities.length) {
      activeCityIndex.value = index;
    }
  }
}