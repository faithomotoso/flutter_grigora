class RestaurantItem {
  String _name;
  String _description;
  String _imageUrl;
  double _price;
  String _cuisineName;
  double _averageRating;

  String get name => _name;
  String get description => _description;
  String get imageUrl => _imageUrl;
  double get price => _price;
  String get cuisineName => _cuisineName;
  double get averageRating => _averageRating;

  RestaurantItem.fromJson(Map<String, dynamic> json) {
    this._name = json["name"];
    this._description = json["description"];
    this._imageUrl = json["image"];
    this._price = double.parse(json["price"] ?? "0");
    this._cuisineName = json["cuisine_name"];
    this._averageRating = double.parse(json["avg_ratings"]?.toString());
  }
}
