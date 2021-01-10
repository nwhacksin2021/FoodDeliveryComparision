import 'categories.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Restaurant {
  int _id;
  String _name;
  String _address;
  double _deliveryFee;
  double _averageRating;

  //List<MenuItem> _listOfMenuItems;
  List<int> _listOfSupportedProviders;
  DateTime _openingTime;
  DateTime _closingTime;
  List<int> _listOfRestaurantCategoriesId;
  List<RestaurantCategory> _listOfRestaurantCategories;

  Restaurant(
      this._id,
      this._name,
      this._address,
      this._deliveryFee,
      this._averageRating,
      //this._listOfMenuItems,
      this._listOfSupportedProviders,
      this._openingTime,
      this._closingTime,
      this._listOfRestaurantCategoriesId,
      this._listOfRestaurantCategories);

  List<RestaurantCategory> get listOfRestaurantCategories =>
      _listOfRestaurantCategories;

  List<int> get listOfRestaurantCategoriesId => _listOfRestaurantCategoriesId;

  DateTime get closingTime => _closingTime;

  DateTime get openingTime => _openingTime;

  List<int> get listOfSupportedProviders => _listOfSupportedProviders;

  //List<MenuItem> get listOfMenuItems => _listOfMenuItems;

  double get averageRating => _averageRating;

  double get deliveryFee => _deliveryFee;

  String get address => _address;

  String get name => _name;

  int get id => _id;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    //TODO:
    List<int> restaurantCategoryIds = [];
    restaurantCategoryIds.add(json['restaurant_category_id']);

    //TODO:
    List<RestaurantCategory> restaurantCategories = [];
    restaurantCategories.add(RestaurantCategory.values[json['restaurant_category_id']]);

//    for (int i = 0; i < json.decode(json['restaurant_category_id']).length; i++ ) {
//      restaurantCategories.add(RestaurantCategory.values[json['restaurant_category_id'][i]]);
//    }

    List<int> providerIds = [];

    List<dynamic> providers = json['providers'];

    for (int i = 0; i < providers.length; i++) {
      providerIds.add(providers[i]['provider_id']);
    }

    return Restaurant(
        json['restaurant_id'],
        json['name'],
        json['address'] + ", " + json['city'],
        null, //delivery fee
        null, //average rating
        providerIds,
        DateTime.parse(json['opening_time']),
        DateTime.parse(json['closing_time']),
        restaurantCategoryIds,
        restaurantCategories);
  }
}

Future<List<Restaurant>> fetchRestaurants(String city) async {
  final http.Response response = await http.get(
    'https://nwhacks2021-timtam-temp.herokuapp.com/api/restaurant/' + city,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var decodedJson = json.decode(response.body);
    decodedJson = decodedJson["payload"];

    print(decodedJson);

    List<Restaurant> restaurant = List<Restaurant>.from(
        decodedJson.map((model) => Restaurant.fromJson(model)));

    return restaurant;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("status code is not 200!");
    throw Exception('Failed to retrieve restaurants');
  }
}
