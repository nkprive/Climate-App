import 'package:clima/utilities/Weather.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CityWeatherDetails extends StatelessWidget {
  final Weather weather;
  CityWeatherDetails({this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              'Temperature:',
              style: kDetailedMessageTextStyleBold,
            ),
            Spacer(),
            Text(
              '${weather.getTemp}',
              style: kDetailedMessageTextStyle,
            )
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          children: [
            Text(
              'Feels like:',
              style: kDetailedMessageTextStyleBold,
            ),
            Spacer(),
            Text(
              '${weather.getFeelsLike}',
              style: kDetailedMessageTextStyle,
            )
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          children: [
            Text(
              'Min temperature:',
              style: kDetailedMessageTextStyleBold,
            ),
            Spacer(),
            Text(
              '${weather.getTempMin}',
              style: kDetailedMessageTextStyle,
            )
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          children: [
            Text(
              'Max temperature:',
              style: kDetailedMessageTextStyleBold,
            ),
            Spacer(),
            Text(
              '${weather.getTempMax}',
              style: kDetailedMessageTextStyle,
            )
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          children: [
            Text(
              'Humidity:',
              style: kDetailedMessageTextStyleBold,
            ),
            Spacer(),
            Text(
              '${weather.getHumidity}',
              style: kDetailedMessageTextStyle,
            )
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          children: [
            Text(
              'Air pressure:',
              style: kDetailedMessageTextStyleBold,
            ),
            Spacer(),
            Text(
              '${weather.getPressure}',
              style: kDetailedMessageTextStyle,
            )
          ],
        ),
      ],
    );
  }
}
