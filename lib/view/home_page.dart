import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weatherapp/view/widget/city_card.dart';
import 'package:weatherapp/view/widget/daily_card.dart';
import 'package:weatherapp/view/widget/hourly_card.dart';
import 'package:weatherapp/view/widget/loading_content.dart';

import '../viewmodel/weather_view_model.dart';

class HomePage extends StatelessWidget {
  final WeatherViewModel weatherViewModel = Get.find<WeatherViewModel>();
  final PageController pageController = PageController( viewportFraction: 0.9, );

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Semantics(
            label: 'The ProjectMark logo',
            child: IconButton(onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/icon_home.svg',
              width: 24,
              height: 24,
              )
            ),
          ),
        ),
        title: const Text('Weather', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Obx(() {
        if (weatherViewModel.isLoading.value) {
          return LoadingContent();
        }

        if (weatherViewModel.error.isNotEmpty) {
          return Center(
            child: Text(
              weatherViewModel.error.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return _buildContent();
      }),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Horizontal city list
        Expanded(
          flex: 0,
          child: SizedBox(
            height: 224,
            child:
            PageView.builder(
              controller: pageController,
              itemCount: weatherViewModel.cities.length,
              itemBuilder: (context, index) {
                final city = weatherViewModel.cities[index];
                return CityCard(city: city);
              },
              onPageChanged: (index) {
                weatherViewModel.updateActiveCityIndex(index);
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            weatherViewModel.cities.length,
                (index) => Obx(() {
              final isActive = weatherViewModel.activeCityIndex.value == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 8 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.grey[800] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        // Hourly weather
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Today',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child:  SizedBox(
            height: 108,
            child: Obx(() {
              final hourlyWeather = weatherViewModel.hourlyWeather;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyWeather.length,
                itemBuilder: (context, index) {
                  final hourly = hourlyWeather[index];
                  return HourlyCard(weather: hourly, isNow: index == 0);
                },
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        // Daily weather
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Next 7 Days',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 3,
          child: Obx(() {
            final dailyWeather = weatherViewModel.dailyWeather;
            return ListView.builder(
              itemCount: dailyWeather.length,
              itemBuilder: (context, index) {
                final daily = dailyWeather[index];
                return DailyCard(weather: daily);
              },
            );
          }),
        ),
      ],
    );
  }
}