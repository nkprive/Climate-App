import 'package:clima/utilities/Weather.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LocationWeatherDetails extends StatefulWidget {
  final Weather weather;

  const LocationWeatherDetails({this.weather});

  @override
  _LocationWeatherDetailsState createState() => _LocationWeatherDetailsState();
}

class _LocationWeatherDetailsState extends State<LocationWeatherDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          '${widget.weather.temp}°️',
          style: kTempTextStyle,
          textAlign: TextAlign.left,
        ),
        Text(
          "It's 🍦 time in San Francisco!",
          style: kMessageTextStyle,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis .",
          style: kDetailedMessageTextStyle,
        ),
        SizedBox(
          height: 35.0,
        ),
      ],
    );
  }
}
