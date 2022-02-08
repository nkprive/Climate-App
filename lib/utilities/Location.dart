import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  get longitude {
    return _longitude;
  }

  get latitude {
    return _latitude;
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  String getStaticMapUrl() {
    try {
      double centerLatitude = _latitude - 0.23;
      double markerLatitude = _latitude;

      String url = 'https://maps.geoapify.com/v1/staticmap?' +
          'style=osm-bright' +
          '&' +
          'width=675' +
          '&' +
          'height=1200' +
          '&' +
          'center=lonlat:$_longitude,$centerLatitude' +
          '&' +
          'zoom=9' +
          '&' +
          'marker=lonlat:' +
          '$_longitude,$markerLatitude;' +
          'type:material;color:%23000000;size:x-large;icon:cloud;icontype:awesome;iconsize:small;whitecircle:no' +
          '&' +
          'apiKey=15c58cf345a24c1cba7a7246c16118eb';

      return url;
    } catch (e) {
      print(e);
    }
  }
}
