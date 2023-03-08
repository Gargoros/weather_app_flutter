import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:weather_application/model/current_weather/current_weather.dart';

import '../utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text("Comfort Level",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 18,
              )),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent
                      .currentWeatherData!.main!.humidity!
                      .toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 10, progressBarWidth: 10),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomColors.firstGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ]),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: const TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.1,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Feels Like ${weatherDataCurrent.currentWeatherData!.main!.feelsLike!.toDouble()}°C",
                  style: const TextStyle(
                    fontSize: 14,
                    height: 0.6,
                    color: CustomColors.textColorBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
