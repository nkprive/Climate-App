import 'package:clima/screens/city_screen.dart';
import 'package:clima/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../UiWidgets/FadedContainer.dart';
import '../UiWidgets/LocationScreenTopNavigation.dart';
import '../UiWidgets/LocationWeatherDetails.dart';
import '../utilities/Location.dart';
import '../utilities/Weather.dart';
import '../utilities/WeatherApi.dart';

WeatherApi weatherApi = WeatherApi();

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Weather weather;
  Location location;
  String staticMapUrl;

  Future<void> getData() async {
    location = Location();
    await location.getCurrentLocation();
    weather = await weatherApi.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    staticMapUrl = location.getStaticMapUrl();

    await Future.delayed(
      Duration(seconds: 4),
      () {
        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // show results
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(staticMapUrl),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                bottom: false,
                top: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FadedContainer(
                      direction: fadeDirection.down,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
                        child: LocationScreenTopNavigation(
                          onLeftTap: () {
                            getData();
                          },
                          onRightTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CityScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    FadedContainer(
                      direction: fadeDirection.up,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: LocationWeatherDetails(
                          weather: weather,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // waiting for results
            return Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
