import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/controller/global_controller.dart';
import 'package:weather_application/model/forecast_weather/forecast_weather.dart';
import 'package:weather_application/utils/custom_colors.dart';

import 'hourly_details_widget.dart';

class ForecastWeatherWidget extends StatelessWidget {
  final WeatherDataForecast weatherDataForecast;
  ForecastWeatherWidget({super.key, required this.weatherDataForecast});

  // card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          alignment: Alignment.topCenter,
          child: const Text(
            "Weather Forecast",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        forecastList(),
      ],
    );
  }

  Widget forecastList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataForecast.forecastWeatherData!.list!.length,
        itemBuilder: ((context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColors.dividerLine.withAlpha(160),
                    ),
                  ],
                  gradient: cardIndex.value == index
                      ? const LinearGradient(colors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ])
                      : null,
                ),
                child: HourlyDetailsWidget(
                  timeStamp:
                      weatherDataForecast.forecastWeatherData!.list![index].dt!,
                  temp: weatherDataForecast
                      .forecastWeatherData!.list![index].main!.temp!,
                  weatherIcon: weatherDataForecast
                      .forecastWeatherData!.list![index].weather![0].icon!,
                  cardIndex: cardIndex.toInt(),
                  index: index,
                ),
              ))));
        }),
      ),
    );
  }
}
