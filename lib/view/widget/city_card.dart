import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors.dart';
import 'package:weatherapp/data/model/city.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({
    super.key,
    required this.city,
  });

  List<Color> _getBackgroundColor() {
    switch (city.weather?.current.temp.round() ?? 0) {
      case <=5:
        return AppColors.cityCardCold;
      case >5 && <=25:
        return AppColors.cityCardWarm;
      case >25:
        return AppColors.cityCardHot;
      default:
        return [const Color(0xFF333333), const Color(0xFF333333)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Semantics(
        label: 'City card for ${city.city} / ${city.state}. The current weather is ${city.weather?.current.temp.round()} degrees celsius,'
            'With a humidity of ${city.weather?.current.humidity} percent and the pressure is ${city.weather?.current.pressure} HPA.',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: _getBackgroundColor(),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${city.city} / ${city.state}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${city.weather?.current.temp.round()}°C',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      'Humidity: ${city.weather?.current.humidity.round()}%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Pressure: ${city.weather?.current.pressure} hPa',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    ),
    );
  }
}