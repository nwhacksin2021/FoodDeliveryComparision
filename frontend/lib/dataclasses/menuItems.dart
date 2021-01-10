import 'dart:convert';

import 'package:http/http.dart' as http;

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

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    List<String> itemCategories = new List();
    itemCategories.add(json['item_category_id']);

    return MenuItem(
        json['item_id'],
        json['name'],
        9.99,
        json['description'],
        null
    );
  }
}

Future<List<MenuItem>> fetchMenuList(int id) async {
  final http.Response response = await http.get(
    'https://nwhacks2021-timtam-temp.herokuapp.com/api/menu/' + id.toString(),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print("hello?");
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var decodedJson = json.decode(response.body);
    decodedJson = decodedJson["payload"];

    print(decodedJson);

    List<MenuItem> menuList = List<MenuItem>.from(
        decodedJson.map((model) => MenuItem.fromJson(model)));

    return menuList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("status code is not 200!");
    throw Exception('Failed to retrieve restaurants');
  }
}