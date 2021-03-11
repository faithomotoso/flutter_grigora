import 'package:flutter_grigora/business_logic/models/RestaurantItem.dart';
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
  String _address;
  String _openingTime;
  String _closingTime;
  List<RestaurantItem> _popularItems;
  List<RestaurantItem> _featuredItems;

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

  String get address => _address;

  String get openingTime => formatTime(_openingTime);

  String get closingTime => formatTime(_closingTime);

  List<RestaurantItem> get popularItems => _popularItems;

  List<RestaurantItem> get featuredItems => _featuredItems;

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
    this._address = json["address"];
    this._openingTime = json["opening_time"];
    this._closingTime = json["closing_time"];
    this._popularItems = List<RestaurantItem>.from(
        json["popular_items"].map((p) => RestaurantItem.fromJson(p)));
    this._featuredItems = List<RestaurantItem>.from(
        json["featured_items"].map((f) => RestaurantItem.fromJson(f)));

    this._distanceString = "${genRandomDouble()} KM Away";
  }
}
