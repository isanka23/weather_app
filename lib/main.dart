import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/pages/home_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "weather app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


//https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=d508e7fb01d89586cc34cae478f91a3c
//https://api.openweathermap.org/data/2.5/weather?q=london&appid=d508e7fb01d89586cc34cae478f91a3c