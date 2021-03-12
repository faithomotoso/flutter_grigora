class Cuisine {
  int _id;
  String _name;
  String _iconUrl;
  String _backgroundIconUrl;
  String _imageUrl;
  String _description;

  int get id => _id;

  String get name => _name;

  String get iconUrl => _iconUrl;

  String get backgroundIconUrl => _backgroundIconUrl;

  String get imageUrl => _imageUrl;

  String get description => _description;

  Cuisine.fromJson(Map<String, dynamic> json) {
    this._id = json["id"];
    this._name = json["name"];
    this._iconUrl = json["icon"];
    this._backgroundIconUrl = json["background_icon"];
    this._imageUrl = json["image"];
    this._description = json["description"];
  }
}