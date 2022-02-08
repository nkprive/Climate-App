import 'package:clima/UiWidgets/FadedContainer.dart';
import 'package:clima/utilities/CityApi.dart';
import 'package:clima/utilities/Weather.dart';
import 'package:clima/utilities/enums.dart';
import 'package:flutter/material.dart';

import '../UiWidgets/CityWeatherDetails.dart';
import '../UiWidgets/SearchBar.dart';
import '../utilities/City.dart';
import '../utilities/WeatherApi.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final cityTextfieldController = TextEditingController();

  Weather weather;
  City city;

  void searchCityWeather() async {
    WeatherApi weatherApi = WeatherApi();
    Weather weatherResponse =
        await weatherApi.getCityWeather(cityTextfieldController.text);

    setState(() {
      weather = weatherResponse;
    });

    CityApi cityApi = CityApi();
    City cityResponse = await cityApi.getCityData(cityTextfieldController.text);

    setState(() {
      city = cityResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: city != null
                ? NetworkImage(city.imageUrl)
                : AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          bottom: false,
          top: false,
          child: Column(
            children: [
              FadedContainer(
                direction: fadeDirection.down,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 50.0, 10.0, 10.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25.0,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        city != null ? city.name : 'Get Weather',
                        style: kButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SearchBar(
                  onTap: searchCityWeather,
                  controller: cityTextfieldController,
                ),
              ),
              Spacer(),
              FadedContainer(
                direction: fadeDirection.up,
                child: weather != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 50.0,
                          top: 30.0,
                        ),
                        child: CityWeatherDetails(weather: weather),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
