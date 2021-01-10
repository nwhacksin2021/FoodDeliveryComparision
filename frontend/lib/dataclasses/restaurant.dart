import 'menuItems.dart';
import 'categories.dart';

class Restaurant{

  int _id;
  String _name;
  String _address;
  double _deliveryFee;
  double _averageRating;
  List<MenuItem> _listOfMenuItems;
  List<int> _listOfSupportedProviders;
  DateTime _openingTime;
  DateTime _closingTime;
  List<RestaurantCategory> _listOfRestaurantCategories;

  Restaurant(this._id, this._name, this._address, this._deliveryFee,
      this._averageRating, this._listOfMenuItems,
      this._listOfSupportedProviders, this._openingTime, this._closingTime,
      this._listOfRestaurantCategories);

  List<RestaurantCategory> get listOfRestaurantCategories =>
      _listOfRestaurantCategories;

  DateTime get closingTime => _closingTime;

  DateTime get openingTime => _openingTime;

  List<int> get listOfSupportedProviders => _listOfSupportedProviders;

  List<MenuItem> get listOfMenuItems => _listOfMenuItems;

  double get averageRating => _averageRating;

  double get deliveryFee => _deliveryFee;

  String get address => _address;

  String get name => _name;

  int get id => _id;


}