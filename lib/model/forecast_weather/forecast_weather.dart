import 'city.dart';
import 'weather_list.dart';

class WeatherDataForecast {
  final ForecastWeather? forecastWeatherData;
  WeatherDataForecast({
    required this.forecastWeatherData,
  });

  factory WeatherDataForecast.fromJson(Map<String, dynamic> json) =>
      WeatherDataForecast(
          forecastWeatherData: ForecastWeather(
        cod: json['cod'] as String?,
        message: json['message'] as int?,
        cnt: json['cnt'] as int?,
        list: List<WeatherList>.from(
            json["list"].map((x) => WeatherList.fromJson(x))),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
      ));
}

class ForecastWeather {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherList>? list;
  City? city;

  ForecastWeather({this.cod, this.message, this.cnt, this.list, this.city});

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      list: List<WeatherList>.from(
          json["list"].map((x) => WeatherList.fromJson(x))),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
        'city': city?.toJson(),
      };
}
