import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/utils_functions.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherDisplay({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Lottie.asset(
                UtilsFunctions()
                    .getWeatherAnimation(condition: weatherModel.condiion),
                width: 400,
                height: 400,
              ),
            ),
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${weatherModel.temperature.toStringAsFixed(1)}°C',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  weatherModel.condiion,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weatherModel.description,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWeatherDetails('Wind', '${weatherModel.windSpeed} m/s'),
                _buildWeatherDetails('Humidity', '${weatherModel.humidity}%'),
                _buildWeatherDetails('Pressure', '${weatherModel.pressure} hPa'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetails(String lable, String value) {
    return Column(
      children: [
        Text(
          lable,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
