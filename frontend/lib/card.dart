import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './dataclasses/deliverer.dart';

//class to build list items
/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.title,
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return null;
  }
}

/// A ListItem that contains data to display a message.
class RestaurantCardItem implements ListItem {
  final String restaurantName;
  final DateTime openingTime;
  final DateTime closingTime;
  final String address;
  final List<int> providers;

  RestaurantCardItem(
      this.restaurantName, this.openingTime, this.closingTime, this.address, this.providers);

  Widget buildProviders(BuildContext context) {

    var iconOptions = [
      Icon(size: 15, )
    ]

    return Column(
      children: <Widget>[
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: providers.length,
            itemBuilder: (BuildContext context, int index) {
              return Deliverer.values[index];
            }),
      ],
    )
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      restaurantName,
      style: TextStyle(fontSize: 24.0),
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(
      "Open at: " +
          DateFormat('hh:mm:ss').format(openingTime) +
          " \n" +
          "Close at:" +
          DateFormat('hh:mm:ss').format(closingTime) +
          " " +
          " \n" +
          "Located at: " +
          address,
      style: TextStyle(fontSize: 16.0),
    );


  }
}
