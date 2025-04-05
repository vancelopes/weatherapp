extension WeatherIcon on String {
  String toWeatherIcon() {
    return 'https://openweathermap.org/img/wn/$this@2x.png';
  }
}