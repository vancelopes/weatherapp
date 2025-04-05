import 'package:get/get.dart';
import 'package:weatherapp/data/repository/weather_repository_impl.dart';
import 'package:weatherapp/viewmodel/weather_view_model.dart';
import '../data/services/weather_api_service.dart';

class DependencyInjector {
  static void init() {
    // Register WeatherAPIService as a singleton
    Get.lazyPut<WeatherAPIService>(() => WeatherAPIService());

    // Register WeatherRepositoryImpl as a singleton
    Get.lazyPut<WeatherRepositoryImpl>(
          () => WeatherRepositoryImpl(Get.find<WeatherAPIService>()),
    );

    // Register WeatherViewModel as a singleton
    Get.lazyPut<WeatherViewModel>(
          () => WeatherViewModel(Get.find<WeatherRepositoryImpl>()),
    );
  }
}