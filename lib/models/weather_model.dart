class WeatherModel {
  final String cityName;
  final double temperature;
  final String condiion;
  final String description;
  final double pressure;
  final double humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condiion,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["name"],
      temperature: json["main"]["temp"].toDouble(),
      condiion: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      pressure: json["main"]["pressure"].toDouble(),
      humidity: json["main"]["humidity"].toDouble(),
      windSpeed: json["wind"]["speed"].toDouble(),
    );
  }
}
