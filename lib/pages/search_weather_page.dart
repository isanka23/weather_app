import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/displayweather.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final WeatherServices _weatherService =
      WeatherServices(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");

  WeatherModel? _weather;
  String? _error;
  final TextEditingController _searchController = TextEditingController();

  //method to fetch the weather
  void _searchWeather() async {
    final city = _searchController.text.trim();

    if (city.isEmpty) {
      setState(() {
        _error = "City name cannot be empty";
      });
      return;
    }
    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (error) {
      setState(() {
        _error = "Error fetching weather data";
      });
      print("Error from weather data : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Weather",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Enter city name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _searchWeather,
                  ),
                ),
                onSubmitted: (value) => _searchWeather(),
              ),
              const SizedBox(height: 15),
              _error != null
                  ? Text(
                      _error!,
                      style: TextStyle(color: Colors.red),
                    )
                  : _weather != null
                      ? WeatherDisplay(weatherModel: _weather!)
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
