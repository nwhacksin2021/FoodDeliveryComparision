class MenuItem {

  int _id;
  String _name;
  double _price;
  String _description;
  List<String> _listOfItemCategories;

  MenuItem(this._id, this._name, this._price, this._description,
      this._listOfItemCategories);

  List<String> get listOfItemCategories => _listOfItemCategories;

  String get description => _description;

  double get price => _price;

  String get name => _name;

  int get id => _id;


}