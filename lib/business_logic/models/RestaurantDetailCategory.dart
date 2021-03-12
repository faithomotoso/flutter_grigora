import 'package:flutter_grigora/business_logic/models/Cuisine.dart';

class RestaurantDetailCategory {
  String _categoryName;
  List<Cuisine> _cuisines;

  String get categoryName => _categoryName;

  List<Cuisine> get cuisines => _cuisines;

  RestaurantDetailCategory.fromJson(Map<String, dynamic> json) {
    this._categoryName = json["category_name"];
    this._cuisines =
        List<Cuisine>.from(json["data"].map((c) => Cuisine.fromJson(c)));
  }
}
