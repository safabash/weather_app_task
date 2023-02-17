import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/city_model.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/model/weather_model.dart';

import '../../core/api_base_url.dart';

class DashBoardRepository {
  static Future<Model?> getService(String city) async {
    final dio = Dio();

    try {
      final Response response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=c0dbb6f1794640eeabf103014222805&q=${city}&aqi=no',
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return Model.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      // AppException.handleError(e, context);
    }
    return null;
  }

  static Future<LocationModel?> getLocation() async {
    final dio = Dio();

    try {
      final Response response = await dio.get(
        ApiBaseUrl.urlLocation,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return LocationModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CityModel?> getCity(String ip) async {
    final dio = Dio();

    try {
      final Response response = await dio.get('https://ipinfo.io/${ip}/geo');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return CityModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
