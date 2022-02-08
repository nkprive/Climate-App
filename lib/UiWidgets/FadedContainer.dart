import 'package:flutter/material.dart';

import '../utilities/enums.dart';

class FadedContainer extends StatelessWidget {
  final Widget child;
  final fadeDirection direction;

  const FadedContainer({this.child, this.direction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: direction == fadeDirection.up
              ? Alignment.bottomCenter
              : Alignment.topCenter,
          end: direction == fadeDirection.up
              ? Alignment.topCenter
              : Alignment.bottomCenter,
          stops: [
            0.0,
            0.4,
            0.6,
            0.9,
            1.0,
          ],
          colors: [
            Colors.black.withOpacity(1.0),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.4),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.0),
          ],
        ),
      ),
      child: child,
    );
  }
}
