import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreenTopNavigation extends StatelessWidget {
  final Function onLeftTap;
  final Function onRightTap;

  const LocationScreenTopNavigation({this.onLeftTap, this.onRightTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: onLeftTap,
          child: FaIcon(
            FontAwesomeIcons.locationArrow,
            size: 25,
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: onRightTap,
          child: FaIcon(
            FontAwesomeIcons.city,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
