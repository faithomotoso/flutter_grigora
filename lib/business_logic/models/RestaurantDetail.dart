import 'package:flutter_grigora/utils/utils.dart';

class RestaurantDetail {
  int _id;
  double _deliveryFee;
  String _restaurantName;
  String _profileImageUrl;
  String _imageUrl;
  String _cuisines;
  double _totalRating;
  int _totalReview;
  String _distanceString;
  double _minOrder = 200;
  String _estimatedPrepTime;

  // double get deliveryFee => _deliveryFee;

  String get deliveryFeeWithCurrency => formatAmountWithCurrency(_deliveryFee);

  String get restaurantName => _restaurantName;

  String get profileImageUrl => _profileImageUrl;

  String get imageUrl => _imageUrl;

  String get cuisines => _cuisines;

  double get totalRating => _totalRating;

  int get totalReview => _totalReview;

  String get distanceString => _distanceString;

  String get minOrderAmount => formatAmountWithCurrency(_minOrder);

  String get prepTime => _estimatedPrepTime;

  RestaurantDetail.fromJson(Map<String, dynamic> json) {
    this._id = json["restaurant_id"];
    this._deliveryFee = json["delivery_fee"].toDouble();
    this._restaurantName = json["restaurant_name"];
    this._profileImageUrl = json["restaurant_profile_image"];
    this._imageUrl = json["restaurant_image"];
    this._cuisines = json["cuisines"];
    this._totalRating = json["total_rating"].toDouble();
    this._totalReview = json["total_review"];
    this._estimatedPrepTime = json["estimated_preparing_time"];

    this._distanceString = "${genRandomDouble()} KM Away";
  }
}
