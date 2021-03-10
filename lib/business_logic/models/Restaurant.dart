class Restaurant {
  int _id;
  String _name;
  String _imageUrl;
  String _address;
  int _preparingTime;
  double _averageRating;
  double _totalRating;

  int get id => _id;

  String get name => _name;

  String get imageUrl => _imageUrl;

  String get address => _address;

  int get preparingTime => _preparingTime;

  double get averageRating => _averageRating;

  double get totalRating => _totalRating;

  Restaurant.fromJson(Map<String, dynamic> json) {
    this._id = json["id"];
    this._name = json["name"];
    this._imageUrl = json["image"];
    this._address = json["address"];
    this._preparingTime = json["preparing_time"];
    this._averageRating = json["average_rating"].toDouble();
    this._totalRating = json["total_rating"].toDouble();
  }
}
