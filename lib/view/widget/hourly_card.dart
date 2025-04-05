import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/constants/weather_icon.dart';
import 'package:weatherapp/data/model/weather.dart';

class HourlyCard extends StatelessWidget {
  final HourlyWeather weather;
  final bool isNow;

  const HourlyCard({
    super.key,
    required this.weather,
    required this.isNow
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(weather.timestamp * 1000);
    final String formattedHour = DateFormat('ha').format(dateTime);

    return Semantics(
      label: 'At $formattedHour, ${weather.temp.round()} degrees.',
      child: Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isNow ? Colors.orange[100] : Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            isNow ? 'Now' : formattedHour,
            style: TextStyle(
              fontSize: 14,
              color: isNow ? Colors.orange[700] : Colors.grey[500],
            ),
          ),
          const SizedBox(height: 4),
          Image.network(
            weather.icon.toWeatherIcon(),
            width: 40, // Set the desired width
            height: 40, // Set the desired height
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, size: 40, color: Colors.red);
            },
          ),
          const SizedBox(height: 4),
          Text(
            '${weather.temp.round()}°C',
            style: TextStyle(
              fontSize: 12,
              color: isNow ? Colors.orange[700] : Colors.grey[500],
            ),
          ),
        ],
      ),
    ),
    );
  }
}