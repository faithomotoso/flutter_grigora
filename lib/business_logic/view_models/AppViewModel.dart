import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/business_logic/models/Promo.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/services/AppApi.dart';

class AppViewModel extends ChangeNotifier {
  List<Cuisine> cuisines;
  List<Promo> promos;
  List<Restaurant> restaurants;

  // Can be a class
  String selectedLocation = "Maitama, Abuja";

  Future fetchHomePage() async {
    // Using future builder
    // Data to be displayed at the homepage
    try {
      Response response = await AppApi.getHomeScreenApi();
      Map<String, dynamic> data = response.data;

      // Cuisines
      cuisines =
          List<Cuisine>.from(data["cuisines"].map((c) => Cuisine.fromJson(c)));

      // Promos
      promos = List<Promo>.from(data["promos"].map((p) => Promo.fromJson(p)));

      // Restaurants
      restaurants = List<Restaurant>.from(
          data["restaurants"].map((r) => Restaurant.fromJson(r)));
    } on DioError {
      rethrow;
    }
  }
}
