class Main {
  int? temp;
  double? feelsLike;
  int? tempMin;
  int? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp']?.toInt(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        tempMin: json['temp_min']?.toInt(),
        tempMax: json['temp_max']?.toInt(),
        pressure: json['pressure']?.toInt(),
        humidity: json['humidity']?.toInt(),
        seaLevel: json['sea_level']?.toInt(),
        grndLevel: json['grnd_level']?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'pressure': pressure,
        'humidity': humidity,
      };
}
