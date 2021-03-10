class Cuisine {
  int _id;
  String _name;
  String _iconUrl;
  String _backgroundIconUrl;

  int get id => _id;

  String get name => _name;

  String get iconUrl => _iconUrl;

  String get backgroundIconUrl => _backgroundIconUrl;

  Cuisine.fromJson(Map<String, dynamic> json) {
    this._id = json["id"];
    this._name = json["name"];
    this._iconUrl = json["icon"];
    this._backgroundIconUrl = json["background_icon"];
  }
}