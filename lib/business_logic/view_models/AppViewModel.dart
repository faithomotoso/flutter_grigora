import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/business_logic/models/Promo.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetail.dart';
import 'package:flutter_grigora/services/AppApi.dart';

class AppViewModel extends ChangeNotifier {
  List<Cuisine> cuisines;
  List<Promo> promos;
  List<Restaurant> restaurants;

  String get companyPhoneNumber => "+234 901 066 9160";

  String get companyEmail => "hello@grigora.ng";

  int get notificationCount => 17;


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

  Future getRestaurantDetail() async {
    // Using future builder, return restaurant detail

    try {
      Response response = await AppApi.getRestaurantDetail();
      return RestaurantDetail.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
