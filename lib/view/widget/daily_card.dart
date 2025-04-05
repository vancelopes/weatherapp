import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/constants/colors.dart';
import 'package:weatherapp/constants/weather_icon.dart';
import 'package:weatherapp/data/model/weather.dart';

class DailyCard extends StatelessWidget {
  final DailyWeather weather;

  const DailyCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(weather.timestamp * 1000);
    final String formattedDay = DateFormat('EEEE').format(dateTime);

    return Semantics(
      label: 'On $formattedDay, ${weather.tempMin.round()}° / ${weather.tempMax.round()}°',
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              formattedDay,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.text),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Image.network(
                weather.icon.toWeatherIcon(),
                width: 32,
                height: 32,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 32, color: Colors.red);
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: AppColors.text, fontFamily: 'Archivo'),
                  children: [
                    TextSpan(
                      text: '${weather.tempMin.round()}°',
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    const TextSpan(text: ' / '),
                    TextSpan(
                      text: '${weather.tempMax.round()}°',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}