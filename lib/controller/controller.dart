import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  onInit() {
    getAll();
    super.onInit();
  }

  TextEditingController searchController = TextEditingController();
  String _searchCity = ''; //DEFAULT CITY
  String _yourKey = ''; // ADD YOUR  OPENWEATHER KEY
  bool _isLoading = true;

  String _cityName = '';
  String _country = '';
  String _weatherMain = '';
  String _icon = '';
  double _currentTemp = 0.0;
  int _humidity = 0;
  int _pressure = 0;
  double _windSpeed = 0.0;
  double _feelsLike = 0.0;

  String get cityName => _cityName;

  String get weatherMain => _weatherMain;
  String get country => _country;
  String get icon => _icon;
  double get temp => _currentTemp;
  int get humidity => _humidity;
  int get pressure => _pressure;
  double get windSpeed => _windSpeed;
  double get feelsLike => _feelsLike;

  bool get isLoading => _isLoading;

  Future getAll() async {
    var _baseUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$_searchCity&units=metric&lang=pt_br&appid=${_yourKey}';
    try {
      var response = await http.get(_baseUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        _cityName = data['name'];
        _currentTemp = data['main']['temp'];
        _weatherMain = data['weather'][0]['description'];
        _country = data['sys']['country'];
        _icon = data['weather'][0]['icon'];
        _humidity = data['main']['humidity'];
        _pressure = data['main']['pressure'];
        _feelsLike = data['main']['feels_like'];
        _windSpeed = data['wind']['speed'];

        _isLoading = false;
        update();
      } else
        _isLoading = true;
      update();
    } catch (_) {}
  }

  searchCity() {
    if (searchController.text.isNotEmpty) {
      _searchCity = searchController.text;
      searchController.clear();
      _isLoading = true;
      getAll();
      update();
    }
  }
}
