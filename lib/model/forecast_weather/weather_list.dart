import 'clouds.dart';
import 'main.dart';
import 'snow.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';
import 'rain.dart';

class WeatherList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  String? dtTxt;
  Snow? snow;
  Rain? rain;

  WeatherList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
    this.snow,
    this.rain,
  });

  factory WeatherList.fromJson(Map<String, dynamic> json) => WeatherList(
        dt: json['dt'] as int?,
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        visibility: json['visibility'] as int?,
        pop: (json['pop'] as num?)?.toDouble(),
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, dynamic>),
        dtTxt: json['dt_txt'] as String?,
        snow: json['snow'] == null
            ? null
            : Snow.fromJson(json['snow'] as Map<String, dynamic>),
        rain: json['rain'] == null
            ? null
            : Rain.fromJson(json['rain'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds?.toJson(),
        'wind': wind?.toJson(),
        'visibility': visibility,
        'pop': pop,
        'sys': sys?.toJson(),
        'dt_txt': dtTxt,
        'snow': snow?.toJson(),
        'rain': rain?.toJson(),
      };
}
