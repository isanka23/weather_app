import 'dart:convert';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/get_location_service.dart';

class WeatherServices {
  // ignore: constant_identifier_names
  static const String BASE_URL =
      "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherServices({required this.apiKey});

  //get the weather from city name
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WeatherModel.fromJson(json);
      } else {
        throw Exception("Error getting weather from city name");
      }
    } catch (error) {
      print(error);
      throw Exception("Error getting weather from city name");
    }
  }

  //get the weather from lat and lon
  Future<WeatherModel> getWeatherFromLocation() async {
    try {
      final location = GetLocationService();
      final cityName = await location.getCityNameFromCurrentLocation();

      final url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WeatherModel.fromJson(json);
      } else {
        throw Exception("failed to load weather data");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("error");
    }
  }
}
