import 'dart:convert';

import 'package:http/http.dart';
import 'package:slugify/slugify.dart';

import 'City.dart';

class CityApi {
  final _baseApi = 'https://api.teleport.org/api/urban_areas/slug:';

  Future<City> getCityData(cityName) async {
    try {
      // Use with custom options.
      var slug = slugify(cityName, lowercase: true, delimiter: '-');
      String cityDataApiCall = _baseApi + slug + '/';
      String imageApiCall = _baseApi + slug + '/images';

      Response cityDataRespone = await get(Uri.parse(cityDataApiCall));
      if (cityDataRespone.statusCode != 200) {
        throw Exception('Statuscode is not 200');
      }
      Response imageRespone = await get(Uri.parse(imageApiCall));
      if (imageRespone.statusCode != 200) {
        throw Exception('Statuscode is not 200');
      }
      String name = jsonDecode(cityDataRespone.body)['name'];
      String url =
          jsonDecode(imageRespone.body)['photos'][0]['image']['mobile'];
      return City(imageUrl: url, name: name);
    } catch (e) {
      print(e);
    }
  }

  // https://api.teleport.org/api/urban_areas/slug:bangkok/images

}
