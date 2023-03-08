import 'dart:convert';
import 'package:weather_application/model/forecast_weather/forecast_weather.dart';

import '../model/current_weather/current_weather.dart';
import '../model/weather_data.dart';
import 'package:http/http.dart' as http;

import '../utils/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  //processing the data from response -> to json
  Future<WeatherData> processData(lat, long) async {
    var responseCurrent = await http.get(Uri.parse(currentApiUrl(lat, long)));
    var jsonStringCurrent = jsonDecode(responseCurrent.body);
    var responseForecast = await http.get(Uri.parse(forecastApiUrl(lat, long)));
    var jsonStringForecast = jsonDecode(responseForecast.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonStringCurrent),
        WeatherDataForecast.fromJson(jsonStringForecast));

    return weatherData!;
  }
}
