// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_application/utils/custom_colors.dart';

import '../model/current_weather/current_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // temperature area
          temperatureAreaWidget(),
          const SizedBox(
            height: 15,
          ),

          // details area
          currentWeatherDetailsAreaWidget(),
        ],
      ),
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.currentWeatherData!.weather![0].icon!}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherDataCurrent.currentWeatherData!.main!.temp!}°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 60,
                color: CustomColors.textColorBlack,
              )),
          TextSpan(
              text: weatherDataCurrent
                  .currentWeatherData!.weather![0].description!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              )),
        ]))
      ],
    );
  }

  Widget currentWeatherDetailsAreaWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  "${weatherDataCurrent.currentWeatherData!.wind!.speed!}km/h",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  "${weatherDataCurrent.currentWeatherData!.clouds!.all!}%",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  "${weatherDataCurrent.currentWeatherData!.main!.humidity!}%",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                )),
          ],
        )
      ],
    );
  }
}
