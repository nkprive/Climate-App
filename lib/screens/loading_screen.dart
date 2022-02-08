import 'package:clima/utilities/Location.dart';
import 'package:flutter/material.dart';

import '../utilities/Weather.dart';
import '../utilities/WeatherApi.dart';

WeatherApi weatherApi = WeatherApi();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    Weather weather = await weatherApi.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }

  @override
  initState() {
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
