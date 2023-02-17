import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/dashboard/dashboard_repository.dart';

import '../../model/city_model.dart';

class DashBoardController with ChangeNotifier {
  DashBoardController() {
    getLocation();
    // getCity();
  }
  Model? model;
  bool isLoading = false;
  // void getAll() async {
  //   log('start');
  //   isLoading = true;
  //   notifyListeners();
  //   model = await DashBoardRepository.getService();
  //   log('end');
  //   isLoading = false;
  //   notifyListeners();
  // }

  CityModel? cityModel;
  final String location = '';
  static LocationModel? locationModel;
  Stream<dynamic> getLocation() async* {
    log('start');
    isLoading = true;
    notifyListeners();
    locationModel = await DashBoardRepository.getLocation().then((value) {
      if (value != null) {
final location = locationModel!.ip;
    cityModel = await DashBoardRepository.getCity(location).then((value) {
        if (value != null) {
          final city = cityModel!.city;
    model = await DashBoardRepository.getService(city);
    isLoading = false;
    notifyListeners();
      }});
      }
    });
    
    
    log(model.toString());
  }

  // void getCity() async {
  //   notifyListeners();
  //   cityModel = await DashBoardRepository.getCity(location);

  //   log(cityModel.toString());
  //   notifyListeners();
  // }
}
