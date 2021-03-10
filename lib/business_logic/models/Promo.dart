class Promo {
  int _id;
  String _name;
  String _imageUrl;
  String _description;
  String _code;

  int get id => _id;

  String get name => _name;

  String get imageUrl => _imageUrl;

  String get description => _description;

  String get code => _code;

  Promo.fromJson(Map<String, dynamic> json) {
    this._id = json["id"];
    this._name = json["name"];
    this._imageUrl = json["image"];
    this._description = json["description"];
    this._code = json["code"];
  }
}