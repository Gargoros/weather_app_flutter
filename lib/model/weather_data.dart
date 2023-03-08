// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'current_weather/current_weather.dart';
import 'forecast_weather/forecast_weather.dart';

class WeatherData {
  final WeatherDataCurrent? currentData;
  final WeatherDataForecast? forecastData;
  WeatherData([
    this.currentData,
    this.forecastData,
  ]);

  //function to fetch these values
  WeatherDataCurrent getCurrentWeather() => currentData!;
  WeatherDataForecast getForecastWeather() => forecastData!;
}
