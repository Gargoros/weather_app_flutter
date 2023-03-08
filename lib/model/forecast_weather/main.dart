class Main {
  int? temp;
  double? feelsLike;
  int? tempMin;
  int? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  int? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp']?.toInt(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        tempMin: json['temp_min']?.toInt(),
        tempMax: json['temp_max']?.toInt(),
        pressure: json['pressure']?.toInt(),
        seaLevel: json['sea_level']?.toInt(),
        grndLevel: json['grnd_level']?.toInt(),
        humidity: json['humidity']?.toInt(),
        tempKf: json['temp_kf']?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
        'humidity': humidity,
        'temp_kf': tempKf,
      };
}
