import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';
import './dataclasses/restaurant.dart';

class DeliveryLogos extends StatelessWidget {
  final List<int> providers;

  DeliveryLogos({Key key, @required this.providers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

class RestaurantListScreen extends StatelessWidget {
  final List<Restaurant> restaurants;

  RestaurantListScreen({Key key, @required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Select a restaurant"),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: restaurants.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          RestaurantCardItem restaurantCard = new RestaurantCardItem(
              restaurant.name,
              restaurant.openingTime,
              restaurant.closingTime,
              restaurant.address);

          return Column(
            children: <Widget>[
              ListTile(
                title: restaurantCard.buildTitle(context),
                isThreeLine: true,
                subtitle: restaurantCard.buildSubTitle(context),
                onTap: () {
                  //TODO: make API call to fetch menu data
                },
                //TODO: show the icons. for some reason you can't access the restaurant variable
                //trailing: DeliveryLogos(restaurant.listOfSupportedProviders),
              ),
            ],
          );
        },
      ),
    );
  }
}
