import 'dart:convert';

import 'package:http/http.dart';

import 'Weather.dart';
import 'constants.dart';

class WeatherApi {
  final _key = kWeatherApiKey;
  final _baseApi = 'https://api.openweathermap.org/data/2.5/weather?';

  Future<Weather> getWeather({double latitude, double longitude}) async {
    final String apiCall = _baseApi +
        'units=metric' +
        '&' +
        'lat=$latitude' +
        '&' +
        'lon=$longitude' +
        '&' +
        'appid=$_key';

    try {
      Response response = await get(Uri.parse(apiCall));
      if (response.statusCode != 200) {
        throw Exception('Statuscode is not 200');
      }
      var json = jsonDecode(response.body)['main'];

      Weather weather = Weather(
        temp: json['temp'].toDouble(),
        feelsLike: json['feels_like'].toDouble(),
        tempMin: json['temp_min'].toDouble(),
        tempMax: json['temp_max'].toDouble(),
        pressure: json['pressure'].toInt(),
        humidity: json['humidity'].toInt(),
      );

      return weather;
    } catch (e) {
      print(e);
    }
  }

  Future<Weather> getCityWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final String apiCall =
        _baseApi + 'units=metric' + '&' + 'q=$city' + '&' + 'appid=$_key';

    try {
      Response response = await get(Uri.parse(apiCall));
      if (response.statusCode != 200) {
        throw Exception('Statuscode is not 200');
      }
      var json = jsonDecode(response.body)['main'];

      print(json);
      Weather weather = Weather(
        temp: json['temp'].toDouble(),
        feelsLike: json['feels_like'].toDouble(),
        tempMin: json['temp_min'].toDouble(),
        tempMax: json['temp_max'].toDouble(),
        pressure: json['pressure'].toInt(),
        humidity: json['humidity'].toInt(),
      );

      return weather;
    } catch (e) {
      print(e);
    }
  }
}
