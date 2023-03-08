import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/model/forecast_weather/forecast_weather.dart';
import 'package:weather_application/utils/custom_colors.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  final WeatherDataForecast weatherDataForecast;
  const WeatherDescriptionWidget({
    Key? key,
    required this.weatherDataForecast,
  }) : super(key: key);

  //String manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat("EEE").format(time);
    return x;
  }

  String getTime(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat("h:mm a").format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              "Weather Description",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 17,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataForecast.forecastWeatherData!.list!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 5, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 30,
                      child: Text(
                        getDay(weatherDataForecast
                            .forecastWeatherData!.list![index].dt),
                        style: const TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        getTime(weatherDataForecast
                            .forecastWeatherData!.list![index].dt),
                        style: const TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          "assets/weather/${weatherDataForecast.forecastWeatherData!.list![index].weather![0].icon}.png"),
                    ),
                    Text(
                        "${weatherDataForecast.forecastWeatherData!.list![index].weather![0].main}"),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
