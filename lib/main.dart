import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/theme_providers.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "weather app",
      theme: Provider.of<ThemeProviders>(context).getThemeData,
      home: const HomePage(),
    );
  }
}


//https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=d508e7fb01d89586cc34cae478f91a3c
//https://api.openweathermap.org/data/2.5/weather?q=london&appid=d508e7fb01d89586cc34cae478f91a3c