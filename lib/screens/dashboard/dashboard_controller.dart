import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/dashboard/dashboard_repository.dart';

import '../../model/city_model.dart';

class DashBoardController with ChangeNotifier {
  DashBoardController() {
    getLocation();
    getCity();
  }
  Model? model;
  bool isLoading = false;
  void getAll() async {
    log('start');
    isLoading = true;
    notifyListeners();
    model = await DashBoardRepository.getService();
    log('end');
    isLoading = false;
    notifyListeners();
  }

  final String location = '';
  static LocationModel? locationModel;
  void getLocation() async {
    log('start');

    notifyListeners();
    locationModel = await DashBoardRepository.getLocation();
    final location = locationModel!.ip;
    log(location.toString());
    notifyListeners();
  }

  CityModel? cityModel;
  void getCity() async {
    notifyListeners();
    cityModel = await DashBoardRepository.getCity(location);

    log(cityModel.toString());
    notifyListeners();
  }
}
