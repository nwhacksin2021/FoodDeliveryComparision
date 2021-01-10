import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';
// class MenuItem {
//
//   int _id;
//   String _name;
//   double _price;
//   String _description;
//   List<String> _listOfItemCategories;
//
//   MenuItem(this._id, this._name, this._price, this._description,
//       this._listOfItemCategories);
//
//   List<String> get listOfItemCategories => _listOfItemCategories;
//
//   String get description => _description;
//
//   double get price => _price;
//
//   String get name => _name;
//
//   int get id => _id;
//
//
// }

class MenuItem extends ListItem {
  int _id;
  String _name;
  double _price;
  String _description;
  List<String> _listOfItemCategories;

  MenuItem(this._id, this._name, this._price, this._description,
      this._listOfItemCategories);


  @override
  Widget buildSubtitle(BuildContext context) {
    return Text("$_price \n $_description");
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      _name,
      style: Theme.of(context).textTheme.title,
    );
  }

  int get id => _id;

  String get name => _name;

  double get price => _price;

  String get description => _description;

  List<String> get listOfItemCategories => _listOfItemCategories;
}