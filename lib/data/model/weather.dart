class WeatherInfo {
  final int timestamp;
  final double temp;
  final int humidity;
  final int pressure;

  WeatherInfo({
    required this.timestamp,
    required this.temp,
    required this.humidity,
    required this.pressure,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      timestamp: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      humidity: json['humidity'] as int,
      pressure: json['pressure'] as int,
    );
  }
}

class HourlyWeather {
  final int timestamp;
  final double temp;
  final String icon;

  HourlyWeather({
    required this.timestamp,
    required this.temp,
    required this.icon,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      timestamp: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      icon: json['weather'][0]['icon'] as String,
    );
  }
}

class DailyWeather {
  final int timestamp;
  final double tempMax;
  final double tempMin;
  final String icon;

  DailyWeather({
    required this.timestamp,
    required this.tempMax,
    required this.tempMin,
    required this.icon,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      timestamp: json['dt'] as int,
      tempMax: (json['temp']['max'] as num).toDouble(),
      tempMin: (json['temp']['min'] as num).toDouble(),
      icon: json['weather'][0]['icon'] as String,
    );
  }
}

class Weather {
  final WeatherInfo current;
  final List<HourlyWeather> hourly;
  final List<DailyWeather> daily;

  Weather({
    required this.current,
    required this.hourly,
    required this.daily,
  });
}