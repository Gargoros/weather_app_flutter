import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/controller/global_controller.dart';
import 'package:weather_application/utils/custom_colors.dart';
import 'package:weather_application/widgets/forecast_weather_wigdet.dart';
import 'package:weather_application/widgets/header_widget.dart';
import '../widgets/comfort_level.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/weather_description_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/clouds.png",
                      height: 200,
                      width: 200,
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    // widget for current weather data
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ForecastWeatherWidget(
                      weatherDataForecast:
                          globalController.getData().getForecastWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WeatherDescriptionWidget(
                      weatherDataForecast:
                          globalController.getData().getForecastWeather(),
                    ),

                    Container(
                      height: 1,
                      color: CustomColors.dividerLine,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ComfortLevel(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
